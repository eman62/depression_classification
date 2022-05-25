import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/view_controllers/02_user_controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../widgets/user_post_item.dart';

class UserPostsScreen extends StatelessWidget {
  const UserPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GetBuilder<UserController>(
        builder: (controller) {
          return ConditionalBuilder(
            condition: controller.isLoadingGettingPosts,
            builder: (context) => Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            fallback: (builder) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10.0,
                    margin: EdgeInsets.all(8.0),
                  ),
                  controller.posts.isEmpty
                      ? const Text('No posts ..')
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.posts.length,
                          itemBuilder: (context, index) {
                            return UserPostItem(
                              controller: controller,
                              model: controller.posts[index],
                              context: context,
                              postIndex: index,
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 15),
                        ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          );
        },
      ),
    );
    ///////////////////
  }
}
