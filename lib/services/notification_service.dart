import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FCM {
  //Probably don't need to make it a singleton
  //But I'm not taking chances.
  static final FCM _instance = FCM._();
  factory FCM() {
    return _instance;
  }
  FCM._();

  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<String> getToken() async {
    return (await FirebaseMessaging.instance.getToken()) ?? '';
  }

  Future<void> setNotifications() async {
    //request notification permission
    final NotificationSettings settings =
        await _firebaseMessaging.requestPermission();

    await _firebaseMessaging.subscribeToTopic('news');

    //set foreground notifications for IOS
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //init awesome notifications
    AwesomeNotifications().initialize(
      //Drawable declared as null
      'resource://drawable/notificationicon',
      [
        NotificationChannel(
          channelKey: 'sendme_order_channel',
          channelName: 'sendme_order_channel',
          channelDescription: 'sendme_notifications',
          onlyAlertOnce: true,
          importance: NotificationImportance.Max,
        )
      ],
    );

    //request authorization
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    //Background
    //has to be declared on main

    //Foreground
    FirebaseMessaging.onMessage.listen(
      (message) async {
        // if (message.data.containsKey('data')) {
        //   // Handle data message
        //   final data = message.data['data'];
        // }
        if (message.data.containsKey('notification')) {
          // Handle notification message
          final data = message.data['notification'];
        }

        AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: Random().nextInt(10),
                channelKey: 'sendme_order_channel',
                color: const Color.fromARGB(0, 255, 0, 0),
                title: message.notification!.title ?? 'Sendme',
                body: message.notification!.body ?? 'Sendme',
                icon: 'resource://drawable/notificationicon',
                displayOnBackground: true,
                displayOnForeground: true,
                largeIcon: 'resource://drawable/largenotificon'));
      },
    );
  }
}

void createNotification({String? title, String? message, int? notificationId}) {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: notificationId ?? Random().nextInt(10),
          channelKey: 'sendme_channel',
          color: const Color.fromARGB(0, 255, 0, 0),
          title: title ?? 'Sendme',
          body: message ?? 'Sendme',
          icon: 'resource://drawable/notificationicon',
          displayOnBackground: true,
          displayOnForeground: true,
          largeIcon: 'resource://drawable/largenotificon'));
}
