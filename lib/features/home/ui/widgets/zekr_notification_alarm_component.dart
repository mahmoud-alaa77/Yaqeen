import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/data/azkaar_data.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/notifications/local_notification_service.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class ZekrNotificationAlarmComponent extends StatefulWidget {
  final String title;
  final String image;
  final void Function()? startOnTap;
  final void Function()? endOnTap;
  final bool isActivated;
  const ZekrNotificationAlarmComponent(
      {super.key,
      required this.title,
      required this.image,
      this.startOnTap,
      this.endOnTap,
      required this.isActivated});

  @override
  State<ZekrNotificationAlarmComponent> createState() =>
      _ZekrNotificationAlarmComponentState();
}

class _ZekrNotificationAlarmComponentState
    extends State<ZekrNotificationAlarmComponent> {
  TimeOfDay? startTime = TimeOfDay.now();
  TimeOfDay? endTime = TimeOfDay.now();
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 12),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 20.r),
      width: double.infinity,
      //height: 150.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () async {
                  startTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (startTime != null)
                    print({
                      startTime!.hour.toString() +
                          ':' +
                          startTime!.minute.toString()
                    });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.primaryColor)),
                  width: 100.w,
                  height: 50.h,
                  child: const Center(
                    child: Text("تحديد وقت البداية"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  endTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (endTime != null)
                    print({
                      endTime!.hour.toString() +
                          ':' +
                          endTime!.minute.toString()
                    });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.primaryColor)),
                  width: 100.w,
                  height: 50.h,
                  child: const Center(
                    child: Text("تحديد وقت النهاية"),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Image.asset(
                  widget.image,
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
                    value: isActive,
                    onChanged: (val) {
                      setState(() {
                        // LocalNotificationsService.cancelAllNotifications();
                        LocalNotificationsService.showNotificationEveryOneMin(
                            notificationTextList: tsapih);
                        isActive = val;
                        // if (startTime == TimeOfDay.now()) {
                        //   LocalNotificationsService.showNotificationEveryOneMin(
                        //       notificationTextList: tsapih);
                        // }
                      });
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
