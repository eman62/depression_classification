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
          title: const Text(
            'Users',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ConditionalBuilder(
            condition: controller.users.isEmpty,
            builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildUsersItem(controller.users[index], context),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: controller.users.length),
            fallback: (context) => const Center(child: Scaffold()),
          ),
        ),
      );
    });
  }

  Widget buildUsersItem(AppUserModel model, context) => Padding(
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
