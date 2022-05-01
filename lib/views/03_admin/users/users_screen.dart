import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/models/user_model.dart';
import 'package:save/view_controllers/03_admin_controllers/admin_controller.dart';
import 'package:get/get.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Users (${controller.userCount})',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ConditionalBuilder(
            condition: controller.users.isEmpty,
            builder: (context) => controller.isLoadingGettingUsers
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text('No Items..'),
            fallback: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => UserItem(model: controller.users[index], context: context),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: controller.users.length),
          ),
        ),
      );
    });
  }
}

class UserItem extends StatelessWidget {

  final AppUserModel model;
  final BuildContext context;

  const UserItem({Key? key, required this.model, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('${model.image}'),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            '${model.name}',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
