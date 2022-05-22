import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:save/models/notification_model.dart';
import 'package:workmanager/workmanager.dart';

import '../view_controllers/02_user_controllers/user_controller.dart';
import '../views/02_user/staticVars.dart';
//////////////////

void saveNotification({
  required String text,
}) async{
  //changeIsLoadingSetNotification(true);
  if (Firebase.apps.length ==0)
  await Firebase.initializeApp();
  NotificationModel model = NotificationModel(
    text: text,
  );
  FirebaseFirestore.instance.collection('notifications').add(model.toMap()).then((value) {
  //  changeIsLoadingSetNotification(false);
  }).catchError((error) {
  //  changeIsLoadingSetNotification(false);
  });
}
////////////////

FlutterLocalNotificationsPlugin? flutterLocalNotificationPlugin;
//FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future showNotification() async {

  int rndmIndex = Random().nextInt(StaticVars().quots.length-1);

  AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    '$rndmIndex.0',
    'depression app',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,

  );
  var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
    threadIdentifier: 'thread_id',
  );
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics
  );
//////////////////////////////////todo: set notifications
//sendNotification(text: StaticVars().quots[rndmIndex]);
  await flutterLocalNotificationPlugin?.show(
    rndmIndex,
    'App Name',
    StaticVars().quots[rndmIndex],
    platformChannelSpecifics,
  );
saveNotification(text:StaticVars().quots[rndmIndex] );
  //var userController =
  // homeController.sendNotification(text: StaticVars().quots[rndmIndex]);

  // print ('eeeeeeeeeeeeeeeeeeeeeeeee');
  // print (StaticVars().quots[rndmIndex]);
  // FirebaseFirestore.instance.collection('notifications').add(StaticVars().quots[rndmIndex]as Map <String,dynamic>);
  // sendNotification(text: StaticVars().quots[rndmIndex]);

  // NotificationModel model = NotificationModel(
  //   text:'emoo',
  // );
  // FirebaseFirestore.instance.collection('notifications').add(model.toMap());
}




void callbackDispatcher() {

  // initial notifications
  var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = const IOSInitializationSettings();

  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

 // WidgetsFlutterBinding.ensureInitialized();

  flutterLocalNotificationPlugin?.initialize(
    initializationSettings,
  );


  Workmanager().executeTask((task, inputData) {
    showNotification();
    return Future.value(true);
  });
}
class FcmManager {

  initialize (){

    Workmanager().initialize(
        callbackDispatcher,
        isInDebugMode: kDebugMode
    );
    Workmanager().registerPeriodicTask(
      "1",
      "periodic Notification",
      frequency: const Duration(minutes: 15),
    );

    Workmanager().registerPeriodicTask(
      "2",
      "periodic Notification at day",
      frequency: const Duration(days: 1),
    );
  }
}
