import 'package:flutter/material.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "لدي حساب بالفعل", style: AppTextStyles.font20W500),
        TextSpan(
          text: " تسجيل الدخول ",
          style: AppTextStyles.font20RedW200,
        ),
      ]),
    );
  }
}
