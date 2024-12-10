import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class ButtonChild extends StatelessWidget {
  final String title;
  final IconData icon;
  const ButtonChild({
    super.key, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(6.r),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 6.r),
      decoration: BoxDecoration(
        color: AppColors.beigeColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 36.w, color: AppColors.primaryColor),
          SizedBox(width: 8.w),
          Text(
            title,
            style: AppTextStyles.font16W700,
          ),
        ],
      ),
    );
  }
}
