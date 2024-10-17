

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class TodayMessage extends StatelessWidget {
  const TodayMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      vertical: 12.h, horizontal: 16.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.beigeColor),
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.voice_chat)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.copy)),
                      ],
                    ),
                    Text(
                      "قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ",
                      style: AppTextStyles.font24RedW500,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "سورة طه : 46",
                      style: AppTextStyles.font20W500,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(.5),
                      indent: 32,
                      endIndent: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.share)),
                      ],
                    ),
                  ]));
  }
}