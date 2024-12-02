import 'package:flutter/material.dart';
import 'package:islamic_app/core/data/quran_data.dart';
import 'package:islamic_app/core/helpers/extentions.dart';
import 'package:islamic_app/core/routing/routes.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class AllQuranList extends StatelessWidget {
  const AllQuranList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: quranArabicName.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            int number = index + 1;
            context.pushNamed(Routes.quranContentDetailScreen,
                arguments: number);
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "${index + 1}",
                    style: AppTextStyles.font24RedW500,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    quranArabicName[index]["name"],
                    style: AppTextStyles.font18W200,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "      ${numberOfPage[index]["num"]}",
                    style: AppTextStyles.font18W200,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    numOfVerses[index] > 9
                        ? "${numOfVerses[index]} اية"
                        : "${numOfVerses[index]} ايات",
                    style: AppTextStyles.font18W200,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    quranArabicName[index]["place"] == "k"
                        ? "🕋 مكية"
                        : "🕌 مدنية",
                    style: AppTextStyles.font18W200,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
