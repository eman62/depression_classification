import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:save/view_controllers/02_user_controllers/user_controller.dart';
import 'package:save/view_controllers/theme_controller.dart';
import 'package:save/views/02_user/posts_screen/user_posts_screen.dart';
import 'package:save/views/02_user/sideBar_pages/aboutDepression_screens/depressionScreens.dart';
import '../../fcm/fcm_manager.dart';
import '../../helpers/constants.dart';
import '../../views/02_user/sideBar_pages/favourite_screen/favourite_screen.dart';
import '../../views/02_user/sideBar_pages/feedback_screen/feedback.dart';
import '../../views/02_user/sideBar_pages/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
import 'add_post/add_post_screen.dart';
import 'depressionState_screen/depression_screen.dart';
import 'friends_screen/friends_screen.dart';
import 'notification_screen/notification_screen.dart';

//////////////////////////////////
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(UserController(),tag: "homeController");
  /////////////////////////////
  @override
  void initState() {

  FcmManager().initialize();
  // FcmManager().showNotification();

    super.initState();
  }

  ////////////////////////////


  final List<TabItem> bottomItems2 = [
    const TabItem(icon: Icon(Icons.home), title: 'Home'),
    const TabItem(icon: Icon(Icons.dynamic_feed_outlined), title: 'Social'),
    const TabItem(icon: Icon(Icons.notifications), title: 'Notifications'),
    const TabItem(icon: Icon(Icons.people_alt_rounded), title: 'Friends'),
  ];

  final List<Widget> screens = [
    const DepressionStateScreen(),
    const UserPostsScreen(),
    const NotificationScreen(),
    const FriendsScreen(),

  ];

  final List<String> name = [
    'Depression Helper',
    'Social',
    'Notifications',
    'Friends',

  ];

  @override
  Widget build(BuildContext context) {
   // Size? size = MediaQuery.of(context).size;
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (controller) {
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
                      ListTile(
                        minLeadingWidth: 70,
                        leading: const Icon(
                          Icons.person,
                          color: defaultColor,
                        ),
                        title: const Text(
                          'Profile',
                          style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        onTap: () {
                          // AppCubit.get(context).getUserData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfileScreen()),
                          );
                        },
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
                          Icons.favorite,
                          color: defaultColor,
                        ),
                        title: const Text(
                          'Favorite',
                          style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FavouriteScreen()),
                          );
                        },
                      ),
                      ListTile(
                        minLeadingWidth: 70,
                        leading: const Icon(
                          Icons.local_hospital,
                          color: defaultColor,
                        ),
                        title: const Text(
                          'Treatment',
                          style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  screen()),
                          );
                        },
                      ),
                      ListTile(
                        minLeadingWidth: 70,
                        leading: const Icon(
                          Icons.feedback,
                          color: defaultColor,
                        ),
                        title: const Text(
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
                  elevation: 0,
                  title:
                  Text(
                    name[controller.currentIndex],
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    IconButton(
                      icon:  Icon(controller.suffix),
                        onPressed: () {
                          controller.changeDarkModeIcon();

                          Get.find<ThemeController>().changeAppThemeMode();
                        },

                    ),
                  ],
                ),
                bottomNavigationBar: ConvexAppBar(
                  items: bottomItems2,
                  // activeColor: Colors.grey[100],
                  // height: 60,
                  initialActiveIndex: controller.currentIndex,
                  backgroundColor: defaultColor,
                  onTap: (index) {
                    controller.changeBottomNavBar(index);
                  },
                ),
                body: ConditionalBuilder(
                  condition: (controller.posts.isNotEmpty || controller.userModel != null),
                  builder: (context) {
                    //  var model = AppCubit.get(context).userModel;
                    return screens[controller.currentIndex];
                  },
                  fallback: (context) => const Center(child: CircularProgressIndicator()),
                ),
              );
      },
    );
  }
}
