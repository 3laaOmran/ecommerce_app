import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final cubit = HomeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: HomeTab(),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: BottomNavigationBar(
                currentIndex: cubit.selectedIndex,
                onTap: cubit.changeSelectedIndex,
                items: [
                  bottomNavigationBarItem(
                      selectedImage: AppAssets.selectedHomeIcon,
                      unSelectedImage: AppAssets.unSelectedHomeIcon,
                      isSelected: cubit.selectedIndex == 0),
                  bottomNavigationBarItem(
                      selectedImage: AppAssets.selectedCategoryIcon,
                      unSelectedImage: AppAssets.unSelectedCategoryIcon,
                      isSelected: cubit.selectedIndex == 1),
                  bottomNavigationBarItem(
                      selectedImage: AppAssets.selectedFavouriteIcon,
                      unSelectedImage: AppAssets.unSelectedFavouriteIcon,
                      isSelected: cubit.selectedIndex == 2),
                  bottomNavigationBarItem(
                      selectedImage: AppAssets.selectedAccountIcon,
                      unSelectedImage: AppAssets.unSelectedAccountIcon,
                      isSelected: cubit.selectedIndex == 3),
                ]),
          ),
        );
      },
    );
  }
}

BottomNavigationBarItem bottomNavigationBarItem({
  required String selectedImage,
  required String unSelectedImage,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      isSelected ? selectedImage : unSelectedImage,
      height: isSelected ? 40.w : 30.w,
    ),
    label: '',
  );
}
