import 'package:flutter/material.dart';
import 'package:islamic_app/core/azkaar_data.dart';
import 'package:islamic_app/core/helpers/extentions.dart';
import 'package:islamic_app/core/routing/routes.dart';

import 'package:islamic_app/core/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/azkaar/ui/widgets/zakr_category_item.dart';

class AzkaarScreen extends StatelessWidget {
  const AzkaarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            backButton: true,
            title: 'ألاذكار',
            subTitle: "أذكار لمختلف المواقف والاحداث\n في الحياة اليومية",
          ),
          ZakrCategoryItem(
            title: 'أذكار الصباح',
            image: "assets/images/icons/sun.png",
            onTap: () {
              context.pushNamed(Routes.allZakrScreen, arguments: azkarElSapah);
            },
          ),
          ZakrCategoryItem(
            title: 'أذكار المساء',
            image: "assets/images/icons/night.png",
            onTap: () {
              context.pushNamed(Routes.allZakrScreen, arguments: azkarElmasaa);
            },
          ),
          ZakrCategoryItem(
            title: 'أذكار بعد الصلاة المكتوبة',
            image: "assets/images/icons/praying.png",
            onTap: () {
              context.pushNamed(Routes.allZakrScreen, arguments: azkarAfterPrayer);
            },
          ),
          ZakrCategoryItem(
            title: 'أذكار النوم',
            image: "assets/images/icons/sleep.png",
            onTap: () {
              context.pushNamed(Routes.allZakrScreen, arguments: azkarSleeping);
            },
          ),
          ZakrCategoryItem(
            title: 'أذكار الاستيقاظ',
            image: "assets/images/icons/get-up.png",
            onTap: () {
              context.pushNamed(Routes.allZakrScreen, arguments: wakeUpZkar);
            },
          ),
          ZakrCategoryItem(
            title: "تسابيح",
            image: "assets/images/icons/tasbih.png",
            onTap: () {
              context.pushNamed(Routes.allZakrScreen, arguments: tsapih);
            },
          ),
        ],
      ),
    ));
  }
}
