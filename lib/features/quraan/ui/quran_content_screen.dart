import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/core/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/quraan/ui/widgets/all_quran_list.dart';

class QuranContentScreen extends StatelessWidget {
  const QuranContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
              backButton: true,
              title: "الفهرس",
              subTitle:
                  "يوضح لك ترتيب السور والايات في القران \nالكريم لتسهيل الوصول"),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 4),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "رقم\nالسورة",
                    style:
                        AppTextStyles.font24RedW500.copyWith(fontSize: 12.sp),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "اسم السورة",
                    style: AppTextStyles.font18RedW200,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "رقم الصفحة",
                    style: AppTextStyles.font18RedW200,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "عدد الايات",
                    style: AppTextStyles.font18RedW200,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "البيان",
                    style: AppTextStyles.font18RedW200,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: AllQuranList())
        ],
      ),
    ));
  }
}
