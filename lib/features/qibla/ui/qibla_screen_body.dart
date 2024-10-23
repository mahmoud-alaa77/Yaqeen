import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/core/widgets/custom_app_bar.dart';

class QiblaScreenBody extends StatelessWidget {
  const QiblaScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const CustomAppBar(
            backButton: false,
            title: 'القبلة',
            subTitle: "ثبت الهاتف حتي يتزامن السهم الاحمر مع\nالاتجاه الصحيح",
          ),
          verticalSpace(120),
          Image.asset(
            "assets/images/icons/qibla.png",
            width: double.infinity,
            height: 200.h,
          ),
          verticalSpace(32),
          Text(
            "أتجاه القبلة",
            style: AppTextStyles.font24W900,
          ),
          verticalSpace(6),
          Text(
            "في حالة عدم اليقين بالاتجاه, جرب بتوجيه الهاتف بشكل\nمختلف وانتظر حتي يتم استقرار الاتجاه الصحيح علي الشاشة",
            style: AppTextStyles.font20W500.copyWith(color: AppColors.beigeColor),
            textAlign: TextAlign.center,
          ),
           verticalSpace(24),
          Text(
            "تجنب وجود اي اجسام مغناطيسية قريبة من الهاتف \nحيث يمكن ان تؤثر علي دقة البوصلة",
            style: AppTextStyles.font20RedW200,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
