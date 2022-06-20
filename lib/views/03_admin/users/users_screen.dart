import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/models/user_model.dart';
import 'package:save/view_controllers/03_admin_controllers/admin_controller.dart';
import 'package:get/get.dart';
import 'package:save/views/03_admin/users/user_friends_screen.dart';

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
                : Center(
                    child: Column(
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
                    ),
                  ),
            fallback: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => UserItem(
                      model: controller.users[index],
                      context: context,
                      score: controller.scoreList[index],
                      index: index,
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
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
  final String score;
  final int index;

  const UserItem(
      {Key? key, required this.model, required this.context, this.score = '--', required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.grey[200],
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          onTap: () {
            Get.find<AdminController>().getUserFriends(model.uId);
            Get.to(UserFriendsScreen(
              index: index,
            ));
          },
          minLeadingWidth: 70,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          leading: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage('${model.image}'),
          ),
          title: Text(
            '${model.name}',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  height: 1.3,
                ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.email}',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      height: 1.3,
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Score: ',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 1,
                          color: Colors.grey,
                        ),
                  ),
                  Text(
                    '$score %',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 1,
                          color: score == '--' ? Colors.grey : getScoreColor(score),
                        ),
                  ),
                ],
              ),
            ],
          ),
          isThreeLine: true,
          trailing: IconButton(
            icon: Icon(
              model.isLocked! ? Icons.no_encryption_gmailerrorred : Icons.lock,
              size: 22,
              color: model.isLocked! ? Colors.green : Colors.red,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      title: Text(
                        model.isLocked! ? 'Enable User' : 'Disable User',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      content: Text(
                        model.isLocked!
                            ? 'Are you sure to enable this account?'
                            : 'Are you sure to disable this account?',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            model.isLocked!
                                ? Get.find<AdminController>().enableUser(model)
                                : Get.find<AdminController>().disableUser(model);
                            Navigator.pop(context);
                          },
                          child: Text(
                            model.isLocked! ? 'Enable' : 'Disable',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: model.isLocked! ? Colors.green : Colors.red),
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}

getScoreColor(String sentimentScore) {
  Color textColor = Colors.black;
  double score = double.parse(sentimentScore);
  if (score >= 0.0 && score < 20.0) {
    textColor = Colors.green;
  } else if (score >= 20.0 && score < 40.0) {
    textColor = Colors.lightGreen;
  } else if (score >= 40.0 && score < 60.0) {
    textColor = Colors.orangeAccent;
  } else if (score >= 60.0 && score < 80.0) {
    textColor = Colors.deepOrange;
  } else if (score >= 80.0 && score <= 100.0) {
    textColor = Colors.red;
  }
  return textColor;
}
