import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/theming/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final void Function()? onTap;
  final Color color;
  final IconData icon;
  const AppIconButton(
      {super.key, this.onTap, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            border: Border.all(color: AppColors.beigeColor, width: 2)),
        width: 40.w,
        height: 40.h,
        child: Center(
            child: Icon(
          icon,
          color: AppColors.primaryColor,
          size: 30.r,
        )),
      ),
    );
  }
}
