import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/core/theming/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final String hint;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  const AppTextFormField(
      {super.key,
      this.suffixIcon,
      this.hintStyle,
      required this.hint,
      this.contentPadding,
      this.enabledBorder,
      this.focusedBorder,
      this.obscureText,
      this.controller,
      required this.validator,
      this.keyboardType,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 6),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        validator: (value) {
          return validator(value);
        },
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: hintStyle ?? AppTextStyles.font18W900,
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsetsDirectional.symmetric(vertical: 15.h, horizontal: 20.w),
          suffixIcon: suffixIcon,
          enabledBorder: enabledBorder ??
              const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: AppColors.beigeColor,
                    width: 1.0,
                  )),
          focusedBorder: focusedBorder ??
              const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.0,
                  )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              )),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              )),
        ),
        obscureText: obscureText ?? false,
        cursorColor: AppColors.primaryColor,
      ),
    );
  }
}
