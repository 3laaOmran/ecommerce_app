import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/features/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 50.h),
      Image.asset(
        AppAssets.routeLogo,
        height: 30.h,
      ),
      SizedBox(height: 15.h),
      Row(
        children: [
          Expanded(
            child: CustomTextFormField(
                verticalPadding: 15.h,
                prefixIcon: AppAssets.searchIcon,
                hintTextStyle: AppStyles.light14primaryDark,
                borderRadius: 100.r,
                hintText: 'What Do You Search For?',
                controller: TextEditingController()),
          ),
          SizedBox(width: 25.w),
          ImageIcon(
            AssetImage(AppAssets.shoppingCart),
            color: AppColors.primaryColor,
            size: 32.sp,
          )
        ],
      )
    ]);
  }
}
