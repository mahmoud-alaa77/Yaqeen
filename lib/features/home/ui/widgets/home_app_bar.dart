import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/core/widgets/app_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 12.w, vertical: 6.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(50),
                  child: Image.network(
                    "https://avatars.githubusercontent.com/u/126196219?v=4",
                    width: 60,
                  ),
                ),
                horizontalSpace(12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "السلام عليكم...👋",
                      style: AppTextStyles.font20W500,
                    ),
                    Text(
                      "محمود علاء",
                      style: AppTextStyles.font20W500,
                    ),
                  ],
                ),
                const Spacer(),
                const AppIconButton(
                  color: Colors.transparent,
                  icon: Icons.search,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
