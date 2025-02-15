import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ThirdPartyModule {
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin get localNotifications => FlutterLocalNotificationsPlugin();
}
