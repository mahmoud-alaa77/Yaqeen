
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/shared_prefrences_helper.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/notifications/local_notification_service.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerTimeItem extends StatefulWidget {
  final String text;
  final String image;
  final String time;
  final int hour;
  final int minute;
  final int notificationId;
  final String notificationBody;
  final String notificationKeyId;
  final void Function(bool)? onChanged;
  const PrayerTimeItem(
      {super.key,
      required this.text,
      required this.image,
      required this.time,
      this.onChanged,
      required this.hour,
      required this.minute,
      required this.notificationKeyId,
      required this.notificationId,
      required this.notificationBody});

  @override
  State<PrayerTimeItem> createState() => _PrayerTimeItemState();
}

class _PrayerTimeItemState extends State<PrayerTimeItem> {
  bool _isSwitchOn = false;

  @override
  void initState() {
    super.initState();
    _loadSwitchState(); // تحميل حالة المفتاح المحفوظة
  }

  Future<void> _loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSwitchOn = prefs.getBool(widget.notificationKeyId) ??
          false; // إذا لم تكن القيمة موجودة، تكون false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 16.r, vertical: 12.r),
      child: Row(
        children: [
          Image.asset(
            widget.image,
            width: 50.w,
          ),
          horizontalSpace(12),
          Expanded(
            flex: 2,
            child: Text(
              widget.text,
              style: AppTextStyles.font20Bold,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.time,
              style: AppTextStyles.font24RedW500.copyWith(fontSize: 28.sp),
            ),
          ),
          ScaleTransition(
            scale: const AlwaysStoppedAnimation(.8),
            child: Switch(
              value: _isSwitchOn,
              onChanged: (val) async {
                setState(() {
                  SharedPrefHelper.saveDataByKey(widget.notificationKeyId, val);
                  _isSwitchOn = val;
                
                if (_isSwitchOn ==
                    true) {
                  LocalNotificationsService.scheduleNotification(
                    id: widget.notificationId,
                    notificationTitle: "وقت الاذان",
                    notificationBody: widget.notificationBody,
                    hour: widget.hour,
                    minute: widget.minute,
                  );
                } else {
                  LocalNotificationsService.cancelNotificationById(
                      widget.notificationId);
                }});
              },
              activeColor: const Color.fromARGB(255, 239, 239, 239),
              activeTrackColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
