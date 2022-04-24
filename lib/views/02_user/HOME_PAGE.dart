import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/models/post_model.dart';
import '../../cubit/cubit.dart';
import '../../cubit/state.dart';
import '../../helpers/constants.dart';
import 'sideBar_pages/favourite_screen/favourite_screen.dart';
import 'sideBar_pages/feedback_screen/feedback.dart';
import 'sideBar_pages/profile_screen/profile_screen.dart';

class HomePage extends  StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          AppCubit.get(context).getPosts();
          return BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              //  var cubit=AppCubit.get(context);
              return Scaffold(
                drawer: Drawer(
                  child: ListView(
                    children: [
                      ConditionalBuilder(
                        condition: AppCubit
                            .get(context)
                            .userModel != null,
                        builder: (context) =>
                            UserAccountsDrawerHeader(accountName: Text(
                                '${AppCubit
                                    .get(context)
                                    .userModel
                                    ?.name}'),
                              accountEmail: Text('${AppCubit
                                  .get(context)
                                  .userModel
                                  ?.email}'),
                              currentAccountPicture: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage('${AppCubit
                                    .get(context)
                                    .userModel
                                    ?.image}'),
                                // child: ClipOval(
                                //  child: Image.network('${AppCubit.get(context).userModel!.image}',fit: BoxFit.cover,width:100,),
                                // ),
                              ),
                            ),
                        fallback: (context) => Center(child: Container()),
                      ),
                      ListTile(
                        minLeadingWidth: 70,
                        leading: Icon(Icons.person, color: defaultColor,),
                        title: Text('Profile', style: TextStyle(
                            color: defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),),
                        onTap: () {
                          // AppCubit.get(context).getUserData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()),
                          );
                        },
                      ),
                      ListTile(
                        minLeadingWidth: 70,
                        leading: Icon(Icons.favorite, color: defaultColor,),
                        title: Text('Favorite', style: TextStyle(
                            color: defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavouriteScreen()),
                          );
                        },
                      ),
                      ListTile(
                        minLeadingWidth: 70,
                        leading: Icon(Icons.feedback, color: defaultColor,),
                        title: Text('Feedback', style: TextStyle(
                            color: defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedbackScreen()),
                          );
                        },
                      ),

                      ListTile(
                        minLeadingWidth: 70,
                        leading: Icon(Icons.logout, color: defaultColor,),
                        title: Text('Log Out', style: TextStyle(
                            color: defaultColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),),
                        onTap: () {
                          // navigateAndFinish(context, SocialLoginScreen());
                          /// todo: sign out
                          // AppCubit.get(context).signOut(context);
                          //  FirebaseAuth.instance.signOut();
                          //  navigateAndFinish(context, SocialLoginScreen());
                        },
                      ),
                    ],
                  ),
                ),
                appBar: AppBar(
                  title: Text(AppCubit
                      .get(context)
                      .name[AppCubit
                      .get(context)
                      .currentIndex], style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications)),
                    IconButton(onPressed: () {
                      // todo: app mode
                      // AppCubit.get(context).changeAppMode();
                      // cubit.changeAppMode();
                    },
                        icon: Icon(Icons.brightness_4_outlined)),

                  ],
                ),

                body: ConditionalBuilder(
                  condition: AppCubit
                      .get(context)
                      .posts
                      .length > 0 || AppCubit
                      .get(context)
                      .userModel != null,
                  builder: (context) =>
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 10.0,
                              margin: EdgeInsets.all(8.0),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  builtPostItem(AppCubit
                                      .get(context)
                                      .posts[index], context, index),
                              separatorBuilder: (context, index) =>
                                  SizedBox(
                                    height: 15,
                                  ),
                              itemCount: AppCubit
                                  .get(context)
                                  .posts
                                  .length,
                            ),
                            SizedBox(height: 25,),
                          ],

                        ),
                      ),
                  fallback: (context) => Center(child: Container(),),
                ),


              );
            },
          );
        }

    );
  }
   Widget builtPostItem(PostModel model, context, index) => Card(
     clipBehavior: Clip.antiAliasWithSaveLayer,
     elevation: 5.0,
     margin: EdgeInsets.symmetric(horizontal: 8.0),
     child: Padding(
       padding: const EdgeInsets.all(10.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             children: [
               CircleAvatar(
                 radius: 25.0,
                 backgroundImage: NetworkImage('${model.image}'),
               ),
               SizedBox(
                 width: 15,
               ),
               Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Text(
                             '${model.name}',
                             style:
                             Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.3,),
                           ),
                           SizedBox(
                             width: 5,
                           ),
                           // Icon(
                           //   Icons.check_circle,
                           //   color: Colors.blue,
                           //   size: 16,
                           //
                           // ),
                         ],
                       ),
                       Text(
                         '${model.dateTime}',
                         style:
                         Theme.of(context).textTheme.caption!.copyWith(height: 1.3,),
                       ),
                     ],
                   )),
               SizedBox(
                 width: 15,
               ),
               IconButton(
                   onPressed: () {},
                   icon: Icon(
                     Icons.more_horiz,
                     size: 18,
                     color: Colors.grey,
                   )),
             ],
           ),
           Padding(
             padding: const EdgeInsets.only(top: 7,bottom: 15),
             child: Container(
               height: 1,
               color: Colors.grey[300],
               width: double.infinity,
             ),
           ),

           Text('${model.text}',
             style: Theme.of(context).textTheme.bodyText1,
           ),
           SizedBox(height: 15,),


           // /////////// error
           //
           // if(model.postImage != null)
           //     Container(
           //   height: 120,
           //   width: double.infinity,
           //   decoration: BoxDecoration(
           //     borderRadius: BorderRadius.circular(5),
           //     image: DecorationImage(
           //       image: NetworkImage('${model.postImage}'),
           //       fit: BoxFit.cover,
           //     ),
           //     ),
           // ),

           Padding(
             padding: const EdgeInsets.symmetric(vertical: 5.0),
             child: Row(
               children: [
                 Expanded(
                   child: InkWell(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical: 5),
                       child: Row(
                         children: [
                           Icon(
                             Icons.favorite,
                             size: 17,
                             color: Colors.grey,
                           ),
                           SizedBox(
                             width: 5,
                           ),
                           Text(
                             '${AppCubit.get(context).likes[index]}',
                             style:
                             Theme.of(context).textTheme.caption!,

                           ),
                         ],
                       ),
                     ),
                     onTap: () {},
                   ),
                 ),
                 Expanded(
                   child: InkWell(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical: 5),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Icon(
                             Icons.mode_comment_rounded,
                             size: 17,
                             color: Colors.grey,
                           ),
                           SizedBox(
                             width: 5,
                           ),
                           Text(
                             '120 comment',
                             style:
                             Theme.of(context).textTheme.caption!,
                           ),
                         ],
                       ),
                     ),
                     onTap: () {},
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(bottom: 10.0),
             child: Container(
               height: 1,
               color: Colors.grey[300],
               width: double.infinity,
             ),
           ),
           Row(
             children: [
               Expanded(
                 child: InkWell(
                   child: Row(
                     children: [
                       CircleAvatar(
                         radius: 18.0,
                         backgroundImage: NetworkImage('${AppCubit.get(context).userModel?.image}'),
                       ),
                       SizedBox(
                         width: 15,
                       ),
                       Text(
                         'write a comment ..',
                         style:
                         Theme.of(context).textTheme.caption!.copyWith(height: 1.3,),
                       ),
                     ],
                   ),
                   onTap: () {},
                 ),
               ),
               InkWell(
                 child: Row(
                   children: [
                     Icon(
                       Icons.favorite,
                       size: 17,
                       color: Colors.grey,
                     ),
                     SizedBox(
                       width: 5,
                     ),
                     Text(
                       'Like',
                       style:
                       Theme.of(context).textTheme.caption!,
                     ),
                   ],
                 ),
                 onTap: () {

                   AppCubit.get(context).likePosts(AppCubit.get(context).postsId[index]);
                 },
               ),
             ],
           ),
         ],
       ),
     ),
   );
}
