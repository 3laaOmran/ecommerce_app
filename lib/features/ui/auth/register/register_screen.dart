import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/custom_dialog.dart';
import 'package:ecommerce_app/core/utils/validator.dart';
import 'package:ecommerce_app/features/ui/auth/register/cubit/register_cubit.dart';
import 'package:ecommerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:ecommerce_app/features/widgets/ask_about_user_account_in_login_and_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final cubit = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          CustomDialog.showLoading(context: context, message: 'Loading....');
        } else if (state is RegisterErrorState) {
          CustomDialog.hideLoading(context);
          CustomDialog.showAlert(
            context: context,
            title: 'Error',
            message: state.failures.errorMsg,
            posActionName: 'Ok',
          );
        } else if (state is RegisterSuccessState) {
          CustomDialog.hideLoading(context);
          CustomDialog.showAlert(
              context: context,
              title: 'Success',
              posActionName: 'Ok',
              posAction: () {
                Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
              },
              message: state.registerResponseEntity.message!);
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
                    SizedBox(
                      height: 50.h,
                    ),
                    Image.asset(
                      AppAssets.routeLogoImage,
                      height: 90.h,
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      'Full Name',
                      style: AppStyles.medium18White,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      hintText: 'enter your full name',
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          AppValidators.validateUserName(value),
                      controller: cubit.nameController,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      'Mobile Number',
                      style: AppStyles.medium18White,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      hintText: 'enter your mobile no.',
                      validator: (value) =>
                          AppValidators.validatePhoneNumber(value),
                      keyboardType: TextInputType.phone,
                      controller: cubit.phoneController,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
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
                    SizedBox(
                      height: 18.h,
                    ),
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
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      'Confirm Password',
                      style: AppStyles.medium18White,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      suffixIcon: cubit.isRePasswordObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onSuffixPressed: () {
                        cubit.changeRePasswordVisibility();
                      },
                      hintText: 'enter your rePassword',
                      validator: (value) =>
                          AppValidators.validateConfirmPassword(
                              value, cubit.passwordController.text),
                      isObscure: cubit.isRePasswordObscure,
                      keyboardType: TextInputType.text,
                      controller: cubit.rePasswordController,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        cubit.register();
                      },
                      buttonText: 'Sign Up',
                    ),
                    SizedBox(height: 10.h),
                    AskUserWidgetInLoginRegister(
                        question: 'Already Have Account? ',
                        textButtonText: 'Login',
                        onPressed: () {
                          Navigator.pop(context);
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
