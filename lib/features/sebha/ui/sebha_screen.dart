import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/data/azkaar_data.dart';
import 'package:islamic_app/core/helpers/extentions.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
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
                    onPressed: () {
                      setState(() {
                        count = 0;
                      });
                    },
                    icon: Icon(
                      Icons.refresh_rounded,
                      size: 60.w,
                      color: AppColors.beigeColor,
                    )),
              ],
            ),
            verticalSpace(100),
            CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 24.r),
                    child: Text(
                      sebhaTextList[index],
                      style: AppTextStyles.font28W500,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                itemCount: sebhaTextList.length,
                options: CarouselOptions(
                  height: 150.h,
                  aspectRatio: 16 / 9,
                  viewportFraction: .5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
            verticalSpace(32),
            Text(
              count.toString(),
              style: AppTextStyles.font24RedW500.copyWith(fontSize: 50.sp),
            ),
            verticalSpace(40),
            GestureDetector(
              onTap: () {
                setState(() {
                  count++;
                });
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 100.w,
                    backgroundColor: AppColors.primaryColor.withOpacity(.7),
                    child: CircleAvatar(
                      radius: 85.w,
                      backgroundColor: const Color.fromARGB(255, 132, 44, 55)
                          .withOpacity(.6),
                      child: CircleAvatar(
                        radius: 70.w,
                        backgroundColor: AppColors.primaryColor,
                        child: Center(
                          child: Icon(
                            Icons.ads_click_outlined,
                            size: 50.w,
                            color: AppColors.beigeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List items = [];
