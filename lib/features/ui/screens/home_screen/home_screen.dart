import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTab(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              bottomNavigationBarItem(
                  selectedImage: AppAssets.selectedHomeIcon,
                  unSelectedImage: AppAssets.unSelectedHomeIcon,
                  isSelected: selectedIndex == 0),
              bottomNavigationBarItem(
                  selectedImage: AppAssets.selectedCategoryIcon,
                  unSelectedImage: AppAssets.unSelectedCategoryIcon,
                  isSelected: selectedIndex == 1),
              bottomNavigationBarItem(
                  selectedImage: AppAssets.selectedFavouriteIcon,
                  unSelectedImage: AppAssets.unSelectedFavouriteIcon,
                  isSelected: selectedIndex == 2),
              bottomNavigationBarItem(
                  selectedImage: AppAssets.selectedAccountIcon,
                  unSelectedImage: AppAssets.unSelectedAccountIcon,
                  isSelected: selectedIndex == 3),
            ]),
      ),
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
