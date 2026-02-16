import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}


class FirebaseCloudMsg {


  //todo: get object from FirebaseMessaging
  static FirebaseMessaging messaging = FirebaseMessaging.instance;


  //todo: send permission request.
  static Future<void> requestPermission() async{
    NotificationSettings setting = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print(setting.authorizationStatus);
  }


  //todo: get fcm token

  static Future<String?> getToken()async{
    String? token = await messaging.getToken();
    print(' this is fcm token ${token}');
    return token;
  }

  static Future<void> subscribeToTopic(String topic)async{
    await messaging.subscribeToTopic(topic);
    print('you have been subscribed to  $topic');
  }

  static Future<void> unSubscribeToTopic(String topic)async{
    await messaging.unsubscribeFromTopic(topic);
    print('you have been unSubscribed to  $topic');
  }

  static Future<void> init()async{
    requestPermission();
    getToken();
    onForegroundFcm();
    onBackgroundFcm();
  }

  static Future<void> onForegroundFcm() async{
    const AndroidNotificationChannel channel = AndroidNotificationChannel (
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription:  channel.description,
                icon: '@mipmap/ic_launcher',
                importance: Importance.max,
                // other properties...
              ),
            ));
      }
    });
  }

  static void onBackgroundFcm(){
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }




}