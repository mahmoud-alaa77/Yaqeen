import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/data/azkaar_data.dart';
import 'package:islamic_app/core/di/dependency_injection.dart';
import 'package:islamic_app/core/helpers/bloc_observer.dart';
import 'package:islamic_app/core/notifications/local_notification_service.dart';
import 'package:islamic_app/core/routing/app_routing.dart';
import 'package:islamic_app/yaqeen_app.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationsService.init();
  LocalNotificationsService.showNotificationEveryOneMin(
      notificationTextList: azkarElSapah);
        


  await ScreenUtil.ensureScreenSize();
  runApp(YaqeenApp(
    appRouter: AppRouting(),
  ));
  setupGetIt();
}
