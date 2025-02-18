import 'package:ecommerce_app/core/cashe/shared_preferences_utils.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_cubit.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:ecommerce_app/features/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.cartRoute);
            },
            child: BlocBuilder<ProductTabCubit, ProductTabStates>(
              builder: (context, state) {
                return Badge(
                  alignment: Alignment.topRight,
                  backgroundColor: AppColors.greenColor,
                  padding: EdgeInsets.all(2),
                  label: Text(
                    ProductTabCubit.get(context).numOfCartItems == 0
                        ? SharedPreferencesUtils.getData(key: 'numItems')
                            .toString()
                        : ProductTabCubit.get(context)
                            .numOfCartItems
                            .toString(),
                    style: AppStyles.regular11White,
                  ),
                  child: ImageIcon(
                    AssetImage(AppAssets.shoppingCart),
                    color: AppColors.primaryColor,
                    size: 32.sp,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      SizedBox(height: 16.h),
    ]);
  }
}
