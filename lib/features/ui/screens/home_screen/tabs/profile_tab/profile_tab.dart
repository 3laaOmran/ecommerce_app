import 'package:ecommerce_app/core/cashe/shared_preferences_utils.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LogOut',
            style: AppStyles.medium20PrimaryDark,
          ),
          SizedBox(
            height: 20.h,
          ),
          IconButton(
              onPressed: () {
                SharedPreferencesUtils.removeData(key: 'token');
                SharedPreferencesUtils.removeData(key: 'numItems');
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.loginRoute, (route) => false);
              },
              icon: Icon(
                Icons.logout,
                color: AppColors.redColor,
                size: 45,
              ))
        ],
      ),
    );
  }
}
