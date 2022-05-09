
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationHelper {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
    

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'Hio',
    'High Importance Notifications',
    importance: Importance.high,
  );

  initLocalNotification() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var androidInitilize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitilize = const IOSInitializationSettings();
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize, iOS: iosInitilize);
    flutterLocalNotificationsPlugin.initialize(initilizationsSettings);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future showNotification({String? title, String? body}) async {
    var androidDetails = AndroidNotificationDetails(channel.id, channel.name,
        importance: Importance.max,
        color: Colors.white,
        // sound: true,
        enableVibration: true,
        enableLights: true,
        playSound: true);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, generalNotificationDetails);
    // await notificationController.getNotificationsByUserId();    
  }
}