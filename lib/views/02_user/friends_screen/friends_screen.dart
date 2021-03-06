import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:save/views/02_user/friends_screen/add_friends_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/friend_model.dart';
import '../../../view_controllers/02_user_controllers/user_controller.dart';
import 'dart:io';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ConditionalBuilder(
            condition: controller.friends.isEmpty,
            builder: (context) => controller.isLoadingGettingFriends
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.group_off,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 22),
                        Text(
                          'you don\'t have Friends yet..',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
            fallback: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => FriendItem(
                model: controller.friends[index],
                context: context,
                index: index,
                username: 'me',
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 17,
              ),
              itemCount: controller.friends.length,
            ),
          ),
        ),
        // if(controller.friends.length != 3)
        floatingActionButton: controller.friends.length != 3
            ? Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: FloatingActionButton(
                  onPressed: () {
                    if (controller.friends.length != 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddFriendScreen()),
                      );
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              )
            : Text(''),
      );
    });
  }
}

class FriendItem extends StatelessWidget {
  final FriendModel model;
  final BuildContext context;
  final int index;
  final String username;

  const FriendItem(
      {Key? key, required this.model, required this.context, required this.index, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.grey[200],
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  '${model.name}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        height: 1.3,
                      ),
                ),
                subtitle: Text(
                  '${model.phone}',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        height: 1.3,
                        color: Colors.grey,
                      ),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.whatsapp,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          sendWhatsapp('+20${model.phone!}', username);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 27,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                  title: Text(
                                    'Delete Friend',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  content: Text(
                                    'Are you sure to delete this friend?',
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
                                        Navigator.pop(context);
                                        controller.deleteFriend(id: controller.friendsId[index]);
                                      },
                                      child: Text(
                                        'Delete',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

sendWhatsapp(String phone, name) async {
  var whatsApp = phone.replaceAll(' ', '');
  var whatsAppURl_android = 'whatsapp://send?phone=$whatsApp&&text=Talk to $name I am not OK.';
  var whatAppURL_ios = 'https://wa.me/$whatsApp';
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunch(whatAppURL_ios)) {
      await launch(whatAppURL_ios, forceSafariVC: false);
      print('Can launch ios $whatsApp');
    } else {
      print('Could not launch ios $whatsApp');
    }
  } else {
    // android
    if (await canLaunch(whatsAppURl_android)) {
      await launch(whatsAppURl_android);
    } else {
      print('Could not launch $whatsApp');
    }
  }
}
