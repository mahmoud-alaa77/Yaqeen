import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/local_database_helper.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/features/sebha/logic/cubit/sebha_cubit.dart';
import 'package:islamic_app/features/sebha/ui/widgets/custom_floating_acion_button.dart';
import 'package:islamic_app/features/sebha/ui/widgets/reset_and_back_buttons.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;
  int currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<SebhaCubit>(context).getAllZekrList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ResetAndBackButtons(
              resetOnPressed: () {
                setState(() {
                  count = 0;
                });
              },
            ),
            verticalSpace(100),
            BlocBuilder<SebhaCubit, SebhaState>(
              builder: (context, state) {
                if (state is AllTsbehListLoaded) {
                  return state.items.isEmpty
                      ? const SizedBox.shrink()
                      : CarouselSlider.builder(
                          itemBuilder: (context, index, realIndex) {
                            return Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 24.r),
                              child: Text(
                                state.items[index].title,
                                style: AppTextStyles.font28W500,
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                          itemCount: state.items.length,
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            height: 165.h,
                            aspectRatio: 16 / 9,
                            viewportFraction: .5,
                            initialPage: 0,
                            // enableInfiniteScroll: true,
                            //reverse: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            // enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          ));
                } else if (state is TsbehListLoading) {
                  return const SizedBox.shrink();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation(AppColors.primaryColor),
                    ),
                  );
                }
              },
            ),
            verticalSpace(32),
            Text(
              count.toString(),
              style: AppTextStyles.font24RedW500.copyWith(fontSize: 50.sp),
            ),
            verticalSpace(40),
            context.read<SebhaCubit>().azkaar!.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        DataBaseHelper().updateCount(context
                            .read<SebhaCubit>()
                            .azkaar![currentIndex]
                            .title);
                        count++;
                      });
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 100.w,
                          backgroundColor:
                              AppColors.primaryColor.withOpacity(.7),
                          child: CircleAvatar(
                            radius: 85.w,
                            backgroundColor:
                                const Color.fromARGB(255, 132, 44, 55)
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
                  )
                : const SizedBox.shrink(),
          ],
        ),
        floatingActionButton: const CustomFloatingActionButon(),
      ),
    );
  }
}
