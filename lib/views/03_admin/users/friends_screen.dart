import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:save/views/02_user/friends_screen/add_friends_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/friend_model.dart';
import '../../../view_controllers/03_admin_controllers/admin_controller.dart';
import 'dart:io';

class FriendsScreen extends StatelessWidget {
  final int index;
  const FriendsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '${controller.users[index].name} friends',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ConditionalBuilder(
            condition: controller.userFriends.isEmpty,
            builder: (context) => controller.isLoadingGettingFriends
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.group_off,
                            size: 80,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 22),
                          Text(
                            '${controller.users[index].name} don\'t have Friends yet..',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            fallback: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => FriendItem(
                model: controller.userFriends[index],
                context: context,
                index: index,
                username: controller.users[index].name!,
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 17,
              ),
              itemCount: controller.userFriends.length,
            ),
          ),
        ),
        // if(controller.friends.length != 3)
        floatingActionButton: controller.userFriends.length != 3
            ? Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: FloatingActionButton(
                  onPressed: () {
                    if (controller.userFriends.length != 3) {
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
    return GetBuilder<AdminController>(builder: (controller) {
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
                trailing: IconButton(
                  icon: const Icon(
                    Icons.whatsapp,
                    size: 30,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    sendWhatsapp('+20${model.phone!}', username);
                  },
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
  var whatsAppURl_android = 'whatsapp://send?phone=$whatsApp&&text=Talk to your friend $name she is not OK.';
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
