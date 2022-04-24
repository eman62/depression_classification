import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubit.dart';
import '../../cubit/state.dart';
import '../../helpers/components/constants.dart';
import '../../views/02_user/sideBar_pages/favourite_screen/favourite_screen.dart';
import '../../views/02_user/sideBar_pages/feedback_screen/feedback.dart';
import '../../views/02_user/sideBar_pages/profile_screen/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    // print (AppCubit.get(context).userModel?.email);
    //var userModel = AppCubit.get(context).mo

    return Builder(builder: (context) {
      AppCubit.get(context).getPosts();

      // AppCubit.get(context).getUserData();
      //  print (AppCubit.get(context).userModel?.email);

      return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // if (AppCubit.get(context).currentIndex==0 && AppCubit.get(context).userModel != null){
          //   AppCubit.get(context).getPosts();
          // }
          // if(state is AppNewPostState){
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) =>  NewPostScreen()),
          //   );
          // }
        },
        builder: (context, state) {
          //  var cubit=AppCubit.get(context);
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  ConditionalBuilder(
                    condition: AppCubit.get(context).userModel != null,
                    builder: (context) => UserAccountsDrawerHeader(
                      accountName: Text('${AppCubit.get(context).userModel?.name}'),
                      accountEmail: Text('${AppCubit.get(context).userModel?.email}'),
                      currentAccountPicture: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('${AppCubit.get(context).userModel?.image}'),
                        // child: ClipOval(
                        //  child: Image.network('${AppCubit.get(context).userModel!.image}',fit: BoxFit.cover,width:100,),
                        // ),
                      ),
                    ),
                    fallback: (context) => Center(child: Container()),
                  ),
                  ListTile(
                    minLeadingWidth: 70,
                    leading: Icon(
                      Icons.person,
                      color: defaultColor,
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    onTap: () {
                      // AppCubit.get(context).getUserData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                  ),
                  ListTile(
                    minLeadingWidth: 70,
                    leading: Icon(
                      Icons.favorite,
                      color: defaultColor,
                    ),
                    title: Text(
                      'Favorite',
                      style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavouriteScreen()),
                      );
                    },
                  ),
                  ListTile(
                    minLeadingWidth: 70,
                    leading: Icon(
                      Icons.feedback,
                      color: defaultColor,
                    ),
                    title: Text(
                      'Feedback',
                      style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackScreen()),
                      );
                    },
                  ),
                  ListTile(
                    minLeadingWidth: 70,
                    leading: Icon(
                      Icons.logout,
                      color: defaultColor,
                    ),
                    title: Text(
                      'Log Out',
                      style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    onTap: () {
                      // navigateAndFinish(context, SocialLoginScreen());
                      // todo: app mode
                      //  AppCubit.get(context).signOut(context);
                      //  FirebaseAuth.instance.signOut();
                      //  navigateAndFinish(context, SocialLoginScreen());
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(
                AppCubit.get(context).name[AppCubit.get(context).currentIndex],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                IconButton(
                    onPressed: () {
                      // todo: app mode

                      // AppCubit.get(context).changeAppMode();
                      // cubit.changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),
            bottomNavigationBar: ConvexAppBar(
              items: AppCubit.get(context).bottomItems2,
              // activeColor: Colors.grey[100],
              initialActiveIndex: AppCubit.get(context).currentIndex,
              backgroundColor: defaultColor,
              onTap: (index) {
                AppCubit.get(context).changeBottomNavBar(index);
              },
              // currentIndex: AppCubit.get(context).currentIndex,
              // onTap: (index){
              //   AppCubit.get(context).changeBottomNavBar(index);
              // },
            ),
            body: ConditionalBuilder(
              condition: (AppCubit.get(context).posts.length > 0 || AppCubit.get(context).userModel != null),
              builder: (context) {
                //  var model = AppCubit.get(context).userModel;
                return AppCubit.get(context).Screens[AppCubit.get(context).currentIndex];
              },
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      );
    });
  }
}
