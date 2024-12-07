import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/helpers/helper_functions.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/notifications/notifacation_ids_constants.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

import 'package:islamic_app/core/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/prayer_time/logic/cubit/prayer_time_cubit.dart';
import 'package:islamic_app/features/prayer_time/ui/widgets/prayer_time_item.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
          builder: (context, state) {
            if (state is PrayerTimeLoaded) {
              return Column(
                children: [
                  const CustomAppBar(
                      backButton: true,
                      title: "مواقيت الصلاة",
                      subTitle:
                          "الصلاة عماد الدّين، وهي ركنٌ ركينٌ من أركان\n الإسلام الخمس، وهي صلة بين العبد بربه"),
                  verticalSpace(12),
                  Text(
                    "${state.prayerTime.country.toString()} / ${state.prayerTime.query.toString()}   ",
                    style: AppTextStyles.font24RedW500,
                  ),
                  PrayerTimeItem(
                    image: "assets/images/icons/fajr.png",
                    text: "صلاة الفجر",
                    time: state.prayerTime.items![0].fajr.toString(),
                    hour: HelperFunctions.getHour(
                        state.prayerTime.items![0].fajr.toString()),
                    minute: HelperFunctions.getMinutes(
                      state.prayerTime.items![0].fajr.toString(),
                    ),
                    notificationId: NotifacationIdsConstants.fajrId,
                    notificationBody: "حان الان موعد اذان الفجر",
                    notificationKeyId: NotifacationIdsConstants.fajrKeyId,
                    
                  ),
                  PrayerTimeItem(
                    image: "assets/images/icons/sunrise.png",
                    text: "الشروق",
                    time: state.prayerTime.items![0].shurooq.toString(),
                    hour: HelperFunctions.getHour(
                        state.prayerTime.items![0].shurooq.toString()),
                    minute: HelperFunctions.getMinutes(
                        state.prayerTime.items![0].shurooq.toString()),
                    notificationId: NotifacationIdsConstants.sunriseId,
                    notificationBody: "حان الان موعد الشروق ",
                    notificationKeyId: NotifacationIdsConstants.sunriseKeyId,
                  ),
                  PrayerTimeItem(
                    image: "assets/images/icons/dhuhr.png",
                    text: "صلاة الظهر",
                    time: state.prayerTime.items![0].dhuhr.toString(),
                    hour: HelperFunctions.getHour(
                        state.prayerTime.items![0].dhuhr.toString()),
                    minute: HelperFunctions.getMinutes(
                        state.prayerTime.items![0].dhuhr.toString()),
                    notificationId: NotifacationIdsConstants.dhuhrId,
                    notificationBody: "حان الان موعد اذان الظهر",
                    notificationKeyId: NotifacationIdsConstants.dhuhrKeyId,
                  ),
                  PrayerTimeItem(
                    notificationId: NotifacationIdsConstants.asrId,
                    notificationBody: "حان الان موعد اذان العصر",
                    notificationKeyId: NotifacationIdsConstants.asrKeyId,
                    image: "assets/images/icons/asr.png",
                    text: "صلاة العصر",
                    time: state.prayerTime.items![0].asr.toString(),
                    hour: HelperFunctions.getHour(
                        state.prayerTime.items![0].asr.toString()),
                    minute: HelperFunctions.getMinutes(
                        state.prayerTime.items![0].asr.toString()),
                  ),
                  PrayerTimeItem(
                    notificationId: NotifacationIdsConstants.maghribId,
                    notificationBody: "حان الان موعد اذان المغرب",
                    notificationKeyId: NotifacationIdsConstants.maghribKeyId,
                    image: "assets/images/icons/maghrib.png",
                    text: "صلاة المغرب",
                    time: state.prayerTime.items![0].maghrib.toString(),
                    hour: HelperFunctions.getHour(
                        state.prayerTime.items![0].maghrib.toString()),
                    minute: HelperFunctions.getMinutes(
                        state.prayerTime.items![0].maghrib.toString()),
                  ),
                  PrayerTimeItem(
                    notificationId: NotifacationIdsConstants.ishaId,
                    notificationBody: "حان الان موعد اذان العشاء",
                    notificationKeyId: NotifacationIdsConstants.ishaKeyId,
                    image: "assets/images/icons/isha.png",
                    text: "صلاة العشاء",
                    time: state.prayerTime.items![0].isha.toString(),
                    hour: HelperFunctions.getHour(
                        state.prayerTime.items![0].isha.toString()),
                    minute: HelperFunctions.getMinutes(
                        state.prayerTime.items![0].isha.toString()),
                  ),
                ],
              );
            } else if (state is PrayerTimeFailure) {
              return Center(child: Text(state.error));
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            }
          },
        ),
      ),
    );
  }
}
