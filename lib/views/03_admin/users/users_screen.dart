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
                : Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.menu,
                  size: 100,
                  color: Colors.grey,
                ),
                Text(
                  'There are no users..',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),),
            fallback: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => UserItem(model: controller.users[index], context: context),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
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
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: Colors.grey[200],
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ListTile(
              minLeadingWidth: 70,
              leading:  CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage('${model.image}'),
              ),
              title: Text(
                '${model.name}',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  height: 1.3,
                ),
              ),
              subtitle: Text(
                '${model.email}',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  height: 1.3,color: Colors.grey,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete,size: 30,color: Colors.red,),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          title: Text('Delete User', style: Theme.of(context).textTheme.bodyText1,),
                          content: Text('Are you sure to delete this account?', style: Theme.of(context).textTheme.bodyText1,),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child:  Text('Cancel', style: Theme.of(context).textTheme.bodyText1,),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);

                              },
                              child: Text('Delete',style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.red),),
                            ),
                          ],
                        );
                      }
                  );
                },),

            ),
          ),
        ),
      ],
    );
  }
}
