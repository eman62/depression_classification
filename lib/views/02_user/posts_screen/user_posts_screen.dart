import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/models/post_model.dart';
import 'package:save/view_controllers/02_user_controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../widgets/post_item.dart';

class UserPostsScreen extends StatelessWidget {
  const UserPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GetBuilder<UserController>(
        builder: (controller) {
          return ConditionalBuilder(
            condition: controller.isLoadingGettingPosts,
            builder: (context) => Center(
              child: Container(),
            ),
            fallback: (context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10.0,
                    margin: EdgeInsets.all(8.0),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.posts.length,
                    itemBuilder: (context, index) {
                      return PostItem(
                          controller: controller,
                          model: controller.posts[index],
                          context: context,
                          index: index,
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