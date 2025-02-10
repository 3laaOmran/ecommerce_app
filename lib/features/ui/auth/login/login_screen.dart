import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/validator.dart';
import 'package:ecommerce_app/features/widgets/ask_about_user_account_in_login_and_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Form(
          // key: cubit.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50.h),
                Image.asset(
                  AppAssets.routeLogoImage,
                  height: 90.h,
                ),
                SizedBox(height: 100.h),
                Text(
                  'Welcome Back To Route',
                  style: AppStyles.semiBold24White,
                ),
                Text(
                  'Please sign in with your mail',
                  style: AppStyles.light16White,
                ),
                SizedBox(height: 50.h),
                Text(
                  'E-mail Address',
                  style: AppStyles.medium18White,
                ),
                SizedBox(height: 10.h),
                CustomTextFormField(
                  hintText: 'enter your email address',
                  validator: (value) => AppValidators.validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  // controller: cubit.emailController,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 18.h),
                Text(
                  'Password',
                  style: AppStyles.medium18White,
                ),
                SizedBox(height: 10.h),
                CustomTextFormField(
                  controller: TextEditingController(),
                  // suffixIcon:cubit.isPasswordObscure? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  // onSuffixPressed: (){
                  //   cubit.changePasswordVisibility();
                  // },
                  hintText: 'enter your password',
                  validator: (value) => AppValidators.validatePassword(value),
                  // isObscure: cubit.isPasswordObscure,
                  keyboardType: TextInputType.text,
                  // controller: cubit.passwordController,
                ),
                TextButton(
                    style: ButtonStyle(
                      alignment: AlignmentDirectional.topEnd,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Forget Password ?',
                      style: AppStyles.light16White,
                    )),
                SizedBox(
                  height: 50.h,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    // cubit.register();
                  },
                  buttonText: 'Login',
                ),
                SizedBox(height: 10.h),
                AskUserWidgetInLoginRegister(
                    question: 'Don\'t Have Account? ',
                    textButtonText: 'Create Account',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.registerRoute);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
