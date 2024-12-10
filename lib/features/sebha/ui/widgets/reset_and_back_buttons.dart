import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/extentions.dart';
import 'package:islamic_app/core/theming/app_colors.dart';

class ResetAndBackButtons extends StatelessWidget {
  final void Function()? resetOnPressed;
  const ResetAndBackButtons({super.key, this.resetOnPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40.w,
              //color: AppColors.beigeColor,
            )),
        IconButton(
            onPressed: resetOnPressed,
            icon: Icon(
              Icons.refresh_rounded,
              size: 60.w,
              color: AppColors.beigeColor,
            )),
      ],
    );
  }
}
