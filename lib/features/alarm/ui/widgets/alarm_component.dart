import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';

import '../../../../core/theming/app_text_styles.dart';

class AlarmComponent extends StatelessWidget {
  final String icon;
  final bool isOn;
  final String title;
  const AlarmComponent(
      {super.key, required this.icon, required this.isOn, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 35.w,
          ),
          horizontalSpace(12),
          Text(
            title,
            style: AppTextStyles.font20W500,
          ),
          const Spacer(),
          Transform.scale(
            scale: .85,
            child: Switch(
              value: isOn,
              onChanged: (val) {},
              activeColor: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
