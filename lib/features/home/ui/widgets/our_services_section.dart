import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/extentions.dart';
import 'package:islamic_app/core/routing/routes.dart';
import 'package:islamic_app/features/home/ui/widgets/category_card.dart';

import '../../../../core/helpers/constants.dart';

class OurServicesSection extends StatelessWidget {
  const OurServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: 8,
        itemBuilder: (context, index) {
          return CategoryCard(
            title: servicesList[index]["title"].toString(),
            imageUrl: servicesList[index]["image"].toString(),
            onTap: () {
              if(servicesList[index]["title"].toString() == "القران الكريم"){
                              context.pushNamed(Routes.quranContentScreen);

              }else if(servicesList[index]["title"].toString() == "الاذكار"){
              context.pushNamed(Routes.azkaarScreen);

              }
            },
          );
        },

        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.h),
        // Generate a list of 10 items
      ),
    );
  }
}
