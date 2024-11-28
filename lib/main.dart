import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/notifications/local_notification_service.dart';
import 'package:islamic_app/core/routing/app_routing.dart';
import 'package:islamic_app/yaqeen_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationsService.init();
  await ScreenUtil.ensureScreenSize();
  runApp(YaqeenApp(
    appRouter: AppRouting(),
  ));
}
