import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class KhatmaSection extends StatelessWidget {
  const KhatmaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        width: double.infinity,
        height: 200.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              child: Image.asset(
                "assets/images/moshaf.webp",
                fit: BoxFit.cover,
                color: Colors.white,
                opacity: const AlwaysStoppedAnimation(.88),
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
            Column(
              //mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(12),
                Text(
                  "حدد ختمتك الأن",
                  style: AppTextStyles.font23BeigeBold,
                ),
                //  verticalSpace(6),
                Text(
                  "كن مثالا حيا للاخرين بختمة القران الكريم ودعوهم\nللانضمام اليك في هذا العمل الصالح",
                  style: AppTextStyles.font22WhiteW500,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(8),
                GestureDetector(
                  child: Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.customWhiteColor,
                    ),
                    child: Center(
                      child: Text(
                        "ابدأ الان",
                        style: AppTextStyles.font24RedW500,
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "    1447/9/12   ",
                      style: AppTextStyles.font25WhiteW500,
                    ))
              ],
            )
          ],
        ));
  }
}
