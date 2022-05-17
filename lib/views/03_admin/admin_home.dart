import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/helpers/constants.dart';
import 'package:save/view_controllers/03_admin_controllers/admin_controller.dart';
import 'package:save/view_controllers/theme_controller.dart';
import 'package:save/views/02_user/add_post/add_post_screen.dart';
import '../widgets/components.dart';
import '../01_auth/login_screen.dart';
import 'feedback/get_feedback.dart';
import 'posts/admin_posts_screen.dart';
import 'users/users_screen.dart';
import 'package:get/get.dart';

class AdminHome extends StatefulWidget {
 const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final adminController = Get.put(AdminController(), permanent: true);

  var _value =false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ConditionalBuilder(
                condition: controller.userModel != null,
                builder: (context) => UserAccountsDrawerHeader(
                  accountName: Text('${controller.userModel?.name}'),
                  accountEmail: Text('${controller.userModel?.email}'),
                  currentAccountPicture: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('${controller.userModel?.image}'),
                    // child: ClipOval(
                    //  child: Image.network('${AppCubit.get(context).userModel!.image}',fit: BoxFit.cover,width:100,),
                    // ),
                  ),
                ),
                fallback: (context) => Center(child: Container()),
              ),

              SwitchListTile(value: _value,onChanged: (value){
                setState(() {
                  Get.find<ThemeController>().changeAppThemeMode();
                  _value =value;

                });
              },
                title: const Text ('Dark Theme', style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),),
                secondary: const Icon(
                  Icons.dark_mode,
                  color: defaultColor,
                ),
              ),
              ListTile(
                minLeadingWidth: 70,
                leading: const Icon(
                  Icons.upload_file,
                  color: defaultColor,
                ),
                title: const Text(
                  'New Post',
                  style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                onTap: () {
                  // AppCubit.get(context).getUserData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewPostScreen()),
                  );
                },
              ),
              ListTile(
                minLeadingWidth: 70,
                leading: const Icon(
                  Icons.logout,
                  color: defaultColor,
                ),
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                onTap: () {
                  controller.signOut(context);

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
          title: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.home,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            /// Users
            Expanded(
              child: InkWell(
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UsersScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          // clipBehavior: Clip.antiAlias,
                          shadowColor: Colors.grey[200],
                          elevation: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //  icon
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.people,
                                    size: 80,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Users',
                                    style: Theme.of(context).textTheme.headline4!,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Posts
            Expanded(
              child: InkWell(
                onTap: () {
                  //  AppCubit.get(context).getPosts();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminPostsScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          // clipBehavior: Clip.antiAlias,
                          shadowColor: Colors.grey[200],
                          elevation: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.post_add,
                                    size: 80,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Posts',
                                    style: Theme.of(context).textTheme.headline4!,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Feedback
            Expanded(
              child: InkWell(
                onTap: () {
                  //  AppCubit.get(context).getFeedbacks();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetFeedbackScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          // clipBehavior: Clip.antiAlias,
                          shadowColor: Colors.grey[200],
                          elevation: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //  icon
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.feedback,
                                    size: 70,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Feedback',
                                    style: Theme.of(context).textTheme.headline4!,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Logout
            // Container(
            //   width: double.infinity,
            //   color: Colors.green,
            //   child: MaterialButton(
            //     height: 50,
            //     onPressed: () {
            //       controller.signOut(context);
            //     },
            //     child: Text(
            //       'Log Out',
            //       style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white, fontSize: 20),
            //     ),
            //   ),
            // )
          ],
        ),
      );
    });
  }
}

