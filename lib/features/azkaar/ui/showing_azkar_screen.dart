import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/core/widgets/custom_app_bar.dart';

class ShowingAzkarScreen extends StatelessWidget {
  final List<Map<String, String>> azkaar;
  const ShowingAzkarScreen({super.key, required this.azkaar});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            backButton: true,
            title: azkaar[0]["category"].toString(),
            subTitle:
                "ان من افضل الاعمال الصالحة اليسيرة \nالتي تقرب العبد من ربه الذكر",
          ),
          Expanded(
            child: ListView.builder(
              itemCount: azkaar.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsetsDirectional.symmetric(
                      vertical: 12, horizontal: 16),
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: 12.r, horizontal: 12.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        azkaar[index]["content"].toString(),
                        style: AppTextStyles.font22W500,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(8),
                      azkaar[index]["description"]!.isEmpty
                          ? const SizedBox.shrink()
                          : Text(
                              azkaar[index]["description"].toString(),
                              style: AppTextStyles.font18W200
                                  .copyWith(color: AppColors.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                      verticalSpace(8),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Center(
                          child: Text(
                            azkaar[index]["count"].toString(),
                            style: AppTextStyles.font24W900,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
