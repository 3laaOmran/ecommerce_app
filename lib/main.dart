import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/core/utils/my_bloc_observer.dart';
import 'package:ecommerce_app/features/ui/auth/login/login_screen.dart';
import 'package:ecommerce_app/features/ui/auth/register/register_screen.dart';
import 'package:ecommerce_app/features/ui/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/home_screen.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_cubit.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cashe/shared_preferences_utils.dart';
import 'core/di/di.dart';
import 'features/ui/screens/cart/cubit/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedPreferencesUtils.init();
  String routeName;
  var token = SharedPreferencesUtils.getData(key: 'token');
  if (token == null) {
    routeName = AppRoutes.loginRoute;
  } else {
    routeName = AppRoutes.homeRoute;
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<ProductTabCubit>()),
      BlocProvider(create: (context) => getIt<CartCubit>()),
    ],
    child: ECommerceApp(
      routeName: routeName,
    ),
  ));
}
class ECommerceApp extends StatelessWidget {
  final String routeName;

  ECommerceApp({super.key, required this.routeName});

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
          initialRoute: routeName,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.productRoute: (context) => ProductDetails(),
            AppRoutes.cartRoute: (context) => CartScreen(),
          },
        );
      },
    );
  }
}