import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("@mipmap/ic_launcher");
  static DarwinInitializationSettings initializationSettingsDarwin =
      const DarwinInitializationSettings();

  static onTap(NotificationResponse notifResponse) {}
  static Future init() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

 static showBasicNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails("idd", "channelName"));

    await flutterLocalNotificationsPlugin.show(
        0, "title", "body", notificationDetails);
  }
}
