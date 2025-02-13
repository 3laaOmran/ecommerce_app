import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? bgColor;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Widget? buttonWidget;
  final void Function() onPressed;
  final BorderSide? border;

  const CustomElevatedButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.border,
      this.bgColor,
      this.buttonWidget,
      this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 17.h),
            shape: RoundedRectangleBorder(
              side: border ??
                  BorderSide(
                    width: 2.w,
                    color: AppColors.whiteColor,
                  ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            backgroundColor: bgColor ?? AppColors.whiteColor,
          ),
          onPressed: onPressed,
          child: buttonWidget ??
              Text(
                buttonText,
                style: buttonTextStyle ?? AppStyles.semiBold20Primary,
              )),
    );
  }
}
