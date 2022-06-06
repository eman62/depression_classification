import 'package:flutter/material.dart';
import 'package:save/view_controllers/02_user_controllers/user_controller.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<UserController>(
        builder: (controller) => controller.notifications.isEmpty
            ? Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Center(child: Text('لا توجد عناصر')),
            )
            : Column(
                children: List.generate(
                  controller.notifications.length,
                  (index) => Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 10),
                    // alignment: Alignment.center,
                    height: 75,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9),
                        bottomLeft: Radius.circular(9),
                        bottomRight: Radius.circular(9),
                      ),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 78,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(child: Text('')),
                            ),
                          ],
                        ),
                        ListTile(
                          minLeadingWidth: 20,
                          dense: true,
                          horizontalTitleGap: 10,
                          leading: Icon(
                            Icons.notifications_active_outlined,
                            size: 25,
                            color: Colors.grey,
                          ),
                          title: Text(
                            controller.notifications[index].text ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
