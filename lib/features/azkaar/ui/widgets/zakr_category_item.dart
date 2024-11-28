import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class ZakrCategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final void Function()? onTap;
  const ZakrCategoryItem(
      {super.key, required this.title, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              image,
              width: 40.w,
            ),
            horizontalSpace(8),
            Text(
              title,
              style: AppTextStyles.font20W500,
            ),
            const Spacer(),
           const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
