import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/core/utils/my_bloc_observer.dart';
import 'package:ecommerce_app/features/ui/auth/login/login_screen.dart';
import 'package:ecommerce_app/features/ui/auth/register/register_screen.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const ECommerceApp());
}
class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          initialRoute: AppRoutes.loginRoute,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}