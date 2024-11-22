import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_jeleapps/core/services/notifications/local_notifications_service.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class FcmService {
  final String? _token;
  const FcmService._(this._token);

  @FactoryMethod(preResolve: true)
  static Future<FcmService> init(
      FirebaseMessaging firebaseMessaging, LocalNotificationsService localNotifications) async {
    await firebaseMessaging.requestPermission();
    final token = await _fetchToken(firebaseMessaging);
    await _onMessage();
    await localNotifications.initLocalNotifications();
    FirebaseMessaging.onMessage.listen(localNotifications.show);
    return FcmService._(token);
  }

  static Future<String?> _fetchToken(FirebaseMessaging firebaseMessaging) => firebaseMessaging.getToken();

  static Future<void> _onMessage() async {
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  static Future<void> _onBackgroundMessage(RemoteMessage message) async {}

  String? get token => _token;
}
