import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

typedef Validation = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final String? prefixIcon;
  final bool? isObscure;
  final Function()? onSuffixPressed;
  final TextEditingController controller;
  final Validation validator;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final double? borderRadius;
  final double? verticalPadding;
  final TextStyle? hintTextStyle;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.isObscure,
      required this.controller,
      this.validator,
      this.onChanged,
      this.keyboardType,
      this.onSuffixPressed,
      this.borderRadius,
      this.hintTextStyle,
      this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      obscureText: isObscure ?? false,
      controller: controller,
      style: hintTextStyle ?? AppStyles.light18HintTextColor,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: verticalPadding ?? 20.h),
        filled: true,
        fillColor: AppColors.whiteColor,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: IconButton(
                  onPressed: onSuffixPressed,
                  icon: Icon(suffixIcon!),
                  color: AppColors.blackColor,
                ),
              )
            : null,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(left: 20.w, right: 8.w),
                child: ImageIcon(
                  AssetImage(prefixIcon!),
                  color: AppColors.primaryColor,
                ),
              )
            : null,
        prefixIconColor: AppColors.whiteColor,
        suffixIconColor: AppColors.whiteColor,
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppStyles.light18HintTextColor,
        // errorStyle: AppStyles.bold12Red,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.redColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.redColor,
          ),
        ),
      ),
    );
  }
}
