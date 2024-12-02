import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/core/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/quraan/logic/cubit/cubit/surah_cubit.dart';

class SurahScreen extends StatefulWidget {
  final int number;
  const SurahScreen({super.key, required this.number});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  void initState() {
    context.read<SurahCubit>().getSurahByNum(widget.number.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SurahCubit, SurahState>(
          builder: (context, state) {
            if (state is SurahLoadedSuccess) {
              return Column(
                children: [
                  CustomAppBar(
                    backButton: true,
                    title: state.surahModel.data!.name.toString(),
                    subTitle: state.surahModel.data!.englishName.toString(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 16,end: 20,start: 20),
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: AppTextStyles.quranTextStyle.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white),
                                children:
                                    state.surahModel.data!.ayahs!.map((data) {
                                  return TextSpan(
                                      text: "${data.text}  ",
                                      style: AppTextStyles.quranTextStyle,
                                      children: [
                                        TextSpan(
                                            text: "﴿${data.numberInSurah}﴾",
                                            style: AppTextStyles.font24RedW500)
                                      ]);
                                }).toList(),
                              ));
                        },
                      ),
                    ),
                  )
                ],
              );
            } else if (state is SurahError) {
              return const Center(
                child: Text("Failed"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
