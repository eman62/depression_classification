import 'package:flutter/material.dart';
import 'package:save/view_controllers/03_admin_controllers/admin_controller.dart';
import '../widgets/components.dart';
import '../01_auth/login_screen.dart';
import 'feedback/get_feedback.dart';
import 'posts/admin_posts_screen.dart';
import 'users/users_screen.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  AdminHome({Key? key}) : super(key: key);

  final adminController = Get.put(AdminController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
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
            Container(
              width: double.infinity,
              color: Colors.green,
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  controller.signOut(context);
                },
                child: Text(
                  'Log Out',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
