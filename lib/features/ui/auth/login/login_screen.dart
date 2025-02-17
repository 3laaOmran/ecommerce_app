import 'package:ecommerce_app/core/cashe/shared_preferences_utils.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/validator.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit/ligin_cubit.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:ecommerce_app/features/widgets/ask_about_user_account_in_login_and_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/custom_dialog.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final cubit = getIt<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          CustomDialog.showLoading(context: context, message: 'Loading....');
        } else if (state is LoginErrorState) {
          CustomDialog.hideLoading(context);
          CustomDialog.showAlert(
            context: context,
            title: 'Error',
            message: state.failures.errorMsg,
            posActionName: 'Ok',
          );
        } else if (state is LoginSuccessState) {
          CustomDialog.hideLoading(context);
          CustomDialog.showAlert(
              context: context,
              title: 'Success',
              posActionName: 'Ok',
              posAction: () {
                SharedPreferencesUtils.saveData(
                    key: 'token', value: state.loginResponseEntity.token);
                Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
              },
              message: state.loginResponseEntity.message!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
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
                      controller: cubit.emailController,
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      'Password',
                      style: AppStyles.medium18White,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      suffixIcon: cubit.isPasswordObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onSuffixPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      hintText: 'enter your password',
                      validator: (value) =>
                          AppValidators.validatePassword(value),
                      isObscure: cubit.isPasswordObscure,
                      keyboardType: TextInputType.text,
                      controller: cubit.passwordController,
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
                        cubit.login();
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
      },
    );
  }
}
