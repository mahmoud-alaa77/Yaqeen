import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

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
    tz.initializeTimeZones();
  }

  static showBasicNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails("idd", "channelNameh",
            priority: Priority.high, importance: Importance.max));

    await flutterLocalNotificationsPlugin.show(
        0, "title", "body", notificationDetails);
  }

  static int azkaarNotificationId = 0;

  static showNotificationEveryOneMin(
      {required List<Map> notificationTextList}) async {
    Timer.periodic(const Duration(minutes: 30), (Timer timer) async {
      if (azkaarNotificationId >= notificationTextList.length) {
        azkaarNotificationId = 0;
      }

      String currentNotification =
          notificationTextList[azkaarNotificationId]["content"];
      NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails("iddd", "channelNamehh",
              priority: Priority.high, importance: Importance.max));

      await flutterLocalNotificationsPlugin.show(
        azkaarNotificationId,
        "",
        currentNotification,
        notificationDetails,
      );

      azkaarNotificationId++;
    });
  }

  static Future<void> scheduleNotification({
    required int id,
    required String notificationTitle,
    required String notificationBody,
    required int hour,
    required int minute,
  }) async {
    final location = tz.getLocation('Africa/Cairo');
    final tz.TZDateTime now = tz.TZDateTime.now(location);
    tz.TZDateTime scheduledTime = tz.TZDateTime(
      location,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      notificationTitle,
      notificationBody,
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "custom_channel_id",
          "Custom Notifications",
          channelDescription: "Notification at a specific time",
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static cancelNotificationById(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
