import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/notifications/local_notification_service.dart';
import 'package:islamic_app/core/theming/app_colors.dart';

import '../../../../core/theming/app_text_styles.dart';

class AlarmComponent extends StatefulWidget {
  final String icon;
  final String title;
  final void  activateNotificationsFunction;

  const AlarmComponent(
      {super.key,
      required this.icon,
      required this.title,
      this.activateNotificationsFunction});

  @override
  State<AlarmComponent> createState() => _AlarmComponentState();
}

class _AlarmComponentState extends State<AlarmComponent> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Image.asset(
            widget.icon,
            width: 35.w,
          ),
          horizontalSpace(12),
          Text(
            widget.title,
            style: AppTextStyles.font20W500,
          ),
          const Spacer(),
          Transform.scale(
            scale: .85,
            child: Switch(
              value: isOn,
              onChanged: (val)async {
                setState(() {
                  isOn = val;
                });
                  await LocalNotificationsService.scheduleNotification(
                id: 200,
                notificationTitle: "تذكير بأذكار الصباح",
                notificationBody: "لا تنسَ قراءة أذكار الصباح! 🌞",
                hour: 13,
                minute:34,
              );
              },
              activeColor: AppColors.primaryColor,
              
            ),
          )
        ],
      ),
    );
  }
}
