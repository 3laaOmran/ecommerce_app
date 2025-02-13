import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_styles.dart';

class CustomDialog {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.whiteColor,
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  message,
                  style: AppStyles.semiBold20Primary,
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showAlert({
    required BuildContext context,
    required String message,
    String title = '',
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: AppStyles.semiBold20Primary,
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionName,
            style: AppStyles.semiBold20Primary,
          )));
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.whiteColor,
            title: Text(
              title,
              style: AppStyles.semiBold20Primary,
            ),
            content: Text(
              message,
              style: AppStyles.medium18Black,
            ),
            actions: actions,
          );
        });
  }
}
