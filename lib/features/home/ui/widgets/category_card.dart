import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String imageUrl;
  const CategoryCard(
      {super.key, this.onTap, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.beigeColor)),
        child: Column(
          children: [
            verticalSpace(4),
            Image.asset(
              imageUrl,
              width: 40.w,
            ),
            Text(
              title,
              style: AppTextStyles.font18W200,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
