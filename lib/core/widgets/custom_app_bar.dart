import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/core/widgets/app_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final bool backButton;
  final String title;
  final String subTitle;

  const CustomAppBar(
      {super.key,
      required this.backButton,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(32),
          bottomEnd: Radius.circular(32),
        ),
        border: BorderDirectional(
            bottom: BorderSide(color: AppColors.beigeColor, width: 2)),
      ),
      width: double.infinity,
      height: 110.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(32),
                bottomEnd: Radius.circular(32),
              ),
              child: Image.asset(
                "assets/images/app_bar_background.jpg",
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.colorBurn,
                color: Theme.of(context).scaffoldBackgroundColor,
                opacity: const AlwaysStoppedAnimation(.5),
              )),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                backButton == true
                    ? const AppIconButton(
                        color: Colors.transparent, icon: Icons.arrow_back)
                    : const SizedBox.shrink(),
                const Spacer(
                  flex: 2,
                ),
                Column(
                  children: [
                    verticalSpace(4),
                    Text(
                      title,
                      style: AppTextStyles.font28W500,
                    ),
                    Text(
                      subTitle,
                      style: AppTextStyles.font20W500
                          .copyWith(color: Colors.black.withOpacity(.6)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Spacer(
                  flex: backButton == true ? 3 : 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
