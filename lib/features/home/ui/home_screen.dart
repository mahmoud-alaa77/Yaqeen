import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/constants.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/features/home/ui/widgets/category_card.dart';
import 'package:islamic_app/features/home/ui/widgets/home_app_bar.dart';
import 'package:islamic_app/features/home/ui/widgets/khatma_section.dart';
import 'package:islamic_app/features/home/ui/widgets/our_services_section.dart';
import 'package:islamic_app/features/home/ui/widgets/today_message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomeAppBar(),
              verticalSpace(24),
              const KhatmaSection(),
              verticalSpace(12),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ما نقدمه لك",
                      style: AppTextStyles.font24W500,
                    ),
                    Text(
                      "عرض المزيد",
                      style: AppTextStyles.font20RedW200,
                    ),
                  ],
                ),
              ),
              const OurServicesSection(),
              verticalSpace(12),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                  child: Text(
                    "رسالتك اليوم",
                    style: AppTextStyles.font24W500,
                  ),
                ),
              ),
              //verticalSpace(4),
              const TodayMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
