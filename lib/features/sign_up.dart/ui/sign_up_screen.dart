import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/helpers/spacing.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';
import 'package:islamic_app/core/widgets/app_text_button.dart';
import 'package:islamic_app/core/widgets/app_text_field.dart';
import 'package:islamic_app/core/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/sign_up.dart/ui/already_have_an_account.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
                backButton: false,
                title: "انشاء حساب",
                subTitle:
                    "أهلا بك, قم بادخال البيانات المطلوبة\nلانشاء الحساب"),
            verticalSpace(12),
            buildLabel(labelText: "اسم المستخدم"),
            AppTextFormField(
              hint: "اكتب اسمك",
              validator: (s) {},
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.grey,
                size: 25.r,
              ),
              hintStyle: AppTextStyles.font18W100Grey,
            ),
            buildLabel(labelText: "رقم الموبايل"),
            AppTextFormField(
              hint: "اكتب رقم موبايلك  20+",
              validator: (s) {},
              prefixIcon: ScaleTransition(
                  scale: const AlwaysStoppedAnimation(.5),
                  child: Image.asset(
                    "assets/images/icons/egypt.png",
                    width: 15.w,
                  )),
              hintStyle: AppTextStyles.font18W100Grey,
            ),
            buildLabel(labelText: "كلمة المرور"),
            AppTextFormField(
              hint: "اكتب كلمة المرور",
              validator: (s) {},
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
                size: 25.r,
              ),
              hintStyle: AppTextStyles.font18W100Grey,
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.grey,
                size: 20.r,
              ),
            ),
            buildLabel(labelText: "تأكيد كلمة المرور"),
            AppTextFormField(
              hint: "تأكيد كلمة المرور",
              validator: (s) {},
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
                size: 25.r,
              ),
              hintStyle: AppTextStyles.font18W100Grey,
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.grey,
                size: 20.r,
              ),
            ),
            verticalSpace(32),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              child: AppTextButton(
                title: "انشاء الحساب",
                width: double.infinity,
                style: Theme.of(context).brightness == Brightness.dark
                    ? AppTextStyles.font22BlackW500
                    : AppTextStyles.font22WhiteW500,
              ),
            ),
           const AlreadyHaveAnAccount()
          ],
        ),
      ),
    );
  }

  Padding buildLabel({required String labelText}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
      child: Text(
        labelText,
        style: AppTextStyles.font20W500,
      ),
    );
  }
}
