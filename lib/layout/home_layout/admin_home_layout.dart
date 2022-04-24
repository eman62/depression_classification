import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/layout/cubit/cubit.dart';
import 'package:save/layout/cubit/state.dart';
import 'package:save/shared/components/components.dart';

import '../../views/01_auth/login_screen.dart';
import '../../views/03_admin/feedback/get_feedback.dart';
import '../../views/03_admin/posts/get_posts.dart';
import '../../views/03_admin/users/users_screen.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(

              title: Container(
                alignment: Alignment.center,
                child:  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home , size: 40,),
                    SizedBox(width: 10,),
                    Text(
                    'Home',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
                  ),
        ],
                ),
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap:() {
                       //AppCubit.get(context).getUsers();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UsersScreen()),
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
                                shadowColor:Colors.grey[200],
                                elevation: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //  icon
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.people,
                                          size: 80,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 15,),
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
                  Expanded(
                    child: InkWell(
                      onTap:() {
                      //  AppCubit.get(context).getPosts();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GetPostsScreen()),
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
                                shadowColor:Colors.grey[200],
                                elevation: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.post_add,
                                          size: 80,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 15,),
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
                  Expanded(
                    child: InkWell(
                      onTap:() {
                      //  AppCubit.get(context).getFeedbacks();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GetFeedbackScreen()),
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
                                shadowColor:Colors.grey[200],
                                elevation: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //  icon
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.feedback,
                                          size: 70,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 15,),
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
                  Container(
                    width: double.infinity,
                    color: Colors.green,
                    child: MaterialButton(
                      height: 50,
                      onPressed: () {
                        navigateAndFinish(context, SocialLoginScreen());
                      },
                      child:  Text(
                        'Log Out',
                        style:  Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white ,fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),


            /////////////////////////////////
          );
        }
    );
  }
}
