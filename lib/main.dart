import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}
class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.registerRoute,
      routes: {
        AppRoutes.registerRoute : (context) => RegisterScreen(),
      },
    );
  }
}