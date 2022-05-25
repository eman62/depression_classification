import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/view_controllers/03_admin_controllers/admin_controller.dart';
import 'package:get/get.dart';
import '../../widgets/admin_post_item.dart';

class AdminPostsScreen extends StatelessWidget {
  const AdminPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Posts',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ConditionalBuilder(
            condition: (controller.posts.isNotEmpty),
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => AdminPostItem(
                model: controller.posts[index],
                context: context,
                postIndex: index,
                controller: controller,
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: controller.posts.length,
            ),
            fallback: (context) => const Center(child: Scaffold()),
          ),
        ),
      );
    });
  }
}

