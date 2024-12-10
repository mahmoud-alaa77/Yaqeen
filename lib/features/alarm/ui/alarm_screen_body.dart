import 'package:flutter/material.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/alarm/ui/widgets/alarm_component.dart';

class AlarmScreenBody extends StatelessWidget {
  const AlarmScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const CustomAppBar(
            backButton: false,
            title: 'المنبه',
            subTitle:
                "يعلمك بأوقات الصلاة ويذكرك بأهم \nالاعمال الصالحة في كل لحظة",
          ),
          verticalSpace(24),
          const AlarmComponent(
            icon: "assets/images/icons/time.png",
            title: "منبه لوقت الاذان",
          ),
          verticalSpace(12),
          const AlarmComponent(
            icon: "assets/images/icons/today_weard.png",
            title: "منبه لتذكيرك بوردك اليومي",
          ),
          verticalSpace(12),
          const AlarmComponent(
            icon: "assets/images/icons/sun.png",
            title: "منبه اذكار الصباح",
            // activateNotificationsFunction: () async {

            // },
          ),
          verticalSpace(12),
          const AlarmComponent(
            icon: "assets/images/icons/night.png",
            title: "منبه اذكار المساء",
            // activateNotificationsFunction: () async {
            //   await LocalNotificationsService().scheduleNotification(
            //     id: 201,
            //     notificationTitle: "تذكير بأذكار المساء",
            //     notificationBody: "لا تنسَ قراءة أذكار المساء! 🌑",
            //     hour: 8,
            //     minute: 39,
            //   );
            // },
          ),
        ],
      ),
    );
  }
}
