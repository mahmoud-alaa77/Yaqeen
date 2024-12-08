import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/features/home/ui/widgets/home_app_bar.dart';
import 'package:islamic_app/features/home/ui/widgets/khatma_section.dart';
import 'package:islamic_app/features/home/ui/widgets/our_services_section.dart';
import 'package:islamic_app/features/home/ui/widgets/today_message.dart';
import 'package:islamic_app/features/home/ui/widgets/zekr_notification_alarm_component.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
Future<void> _selectTime(BuildContext context) async {

        final TimeOfDay? picked = await showTimePicker(

          context: context,

          initialTime: TimeOfDay.now(),

        );

        if (picked != null)

          print({picked.hour.toString() + ':' + picked.minute.toString()});

      }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeAppBar(),
          verticalSpace(24),
          const KhatmaSection(),
          verticalSpace(12),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ما نقدمه لك",
                  style: AppTextStyles.font24W500,
                ),
                Text(
                  "عرض المزيد",
                  style: AppTextStyles.font20RedW200,
                ),
              ],
            ),
          ),
          const OurServicesSection(),
          verticalSpace(12),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              child: Text(
                "رسالتك اليوم",
                style: AppTextStyles.font24W500,
              ),
            ),
          ),
          //verticalSpace(4),
          const TodayMessage(),
          verticalSpace(16),
           ZekrNotificationAlarmComponent(
            image: "assets/images/icons/sun.png",
            title: "التنبيه لاذكار الصباح",
            isActivated: true,
            startOnTap:()async{
              final TimeOfDay? picked = await showTimePicker(

          context: context,

          initialTime: TimeOfDay.now(),

        );

        if (picked != null)

          print({picked.hour.toString() + ':' + picked.minute.toString()});
            },
          ),
        ],
      ),
    );
  }
}
