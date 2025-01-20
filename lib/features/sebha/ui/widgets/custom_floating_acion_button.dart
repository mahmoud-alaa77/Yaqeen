import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/di/dependency_injection.dart';
import 'package:islamic_app/core/helpers/extentions.dart';
import 'package:islamic_app/core/helpers/local_database_helper.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/features/sebha/logic/cubit/sebha_cubit.dart';
import 'package:islamic_app/features/sebha/ui/widgets/cutton_chid.dart';

class CustomFloatingActionButon extends StatelessWidget {
  const CustomFloatingActionButon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        horizontalSpace(16),

///////////////////////////////////////////////00000000000000000000000000000000 */
///////////////////////////////////////////////00000000000000000000000000000000 */

        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return BlocProvider(
                  create: (context) => getIt<SebhaCubit>()..getAllZekrList(),
                  child: BlocBuilder<SebhaCubit, SebhaState>(
                    builder: (context, state) {
                      if (state is AllTsbehListLoaded) {
                        return state.items.isNotEmpty
                            ? SizedBox(
                                height: 400.h,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 16.r),
                                  child: Expanded(
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          color: AppColors.beigeColor,
                                          endIndent: 32.w,
                                          indent: 32.w,
                                        );
                                      },
                                      itemCount: state.items.length,
                                      itemBuilder: (context, index) {
                                        // int allCount=0;
                                        // if (index < state.items.length) {
                                        //   allCount = state.items[index].count +
                                        //       state.items[index + 1].count;
                                        // }

                                        return index == 0
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        "العدد الكلي : ${state.allCount}",
                                                        style: AppTextStyles
                                                            .font23BeigeBold,
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            DataBaseHelper()
                                                                .resetAllCounts();
                                                            context
                                                                .read<
                                                                    SebhaCubit>()
                                                                .getAllZekrList();
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .restart_alt_rounded,
                                                            color: AppColors
                                                                .beigeColor,
                                                            size: 35.r,
                                                          ))
                                                    ],
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      state.items[index].title
                                                          .toString(),
                                                      style: AppTextStyles
                                                          .font24RedW500,
                                                    ),
                                                    subtitle: Text(
                                                      " عدد التكرار : ${state.items[index].count}",
                                                      style: AppTextStyles
                                                          .font20Bold,
                                                    ),
                                                    trailing: IconButton(
                                                        onPressed: () {
                                                          DataBaseHelper()
                                                              .deleteFromAzkarList(
                                                                  state
                                                                      .items[
                                                                          index]
                                                                      .title);
                                                          context
                                                              .read<
                                                                  SebhaCubit>()
                                                              .getAllZekrList();
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .delete_forever_outlined,
                                                          color: AppColors
                                                              .primaryColor,
                                                        )),
                                                  ),
                                                ],
                                              )
                                            : ListTile(
                                                title: Text(
                                                  state.items[index].title
                                                      .toString(),
                                                  style: AppTextStyles
                                                      .font24RedW500,
                                                ),
                                                subtitle: Text(
                                                  " عدد التكرار : ${state.items[index].count}",
                                                  style:
                                                      AppTextStyles.font20Bold,
                                                ),
                                                trailing: IconButton(
                                                    onPressed: () {
                                                      DataBaseHelper()
                                                          .deleteFromAzkarList(
                                                              state.items[index]
                                                                  .title);
                                                      context
                                                          .read<SebhaCubit>()
                                                          .getAllZekrList();
                                                    },
                                                    icon: const Icon(
                                                      Icons
                                                          .delete_forever_outlined,
                                                      color: AppColors
                                                          .primaryColor,
                                                    )),
                                              );
                                      },
                                    ),
                                  ),
                                ),
                              )

///////////////////////////////////////////////00000000000000000000000000000000 */
///////////////////////////////////////////////00000000000000000000000000000000 */

                            : SizedBox(
                                height: 600.h,
                                child: Center(
                                  child: Text(
                                    "لا توجد اذكار لعرضها",
                                    style: AppTextStyles.font23BeigeBold,
                                  ),
                                ),
                              );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                );
              },
            );
          },
          child: const ButtonChild(
            title: "رؤيه السجل",
            icon: Icons.menu,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<SebhaCubit>().getAllZekrList();
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return BlocProvider(
                  create: (context) => getIt<SebhaCubit>()..getAllZekrList(),
                  child: BlocBuilder<SebhaCubit, SebhaState>(
                    builder: (context, state) {
                      return Container(
                        decoration:
                            const BoxDecoration(color: AppColors.beigeColor),
                        padding: EdgeInsets.only(
                          left: 24.r,
                          right: 24.r,
                          top: 16.r,
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              verticalSpace(16.h),
                              TextField(
                                onSubmitted: (val) {
                                  BlocProvider.of<SebhaCubit>(context)
                                      .zekrController
                                      ?.text = val;
                                },
                                controller: BlocProvider.of<SebhaCubit>(context)
                                    .zekrController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("اضافة ذكر جديد"),
                                ),
                              ),
                              verticalSpace(12),
                              GestureDetector(
                                onTap: () async {
                                  await DataBaseHelper().addItemToSebhaList(
                                    BlocProvider.of<SebhaCubit>(context)
                                            .zekrController
                                            ?.text ??
                                        "",
                                  );

                                  context.pop();
                                  context.read<SebhaCubit>().getAllZekrList();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  padding: EdgeInsetsDirectional.symmetric(
                                      vertical: 6.r, horizontal: 10.r),
                                  child: Text(
                                    "اضافة",
                                    style: AppTextStyles.font18W200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          child: const ButtonChild(
            title: "اضافه ذكر جديد",
            icon: Icons.add,
          ),
        ),
      ],
    );
  }
}
