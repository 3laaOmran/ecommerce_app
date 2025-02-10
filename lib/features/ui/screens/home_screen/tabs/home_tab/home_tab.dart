import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DefaultAppBar(),
            SizedBox(height: 16.h),
            ImageSlideshow(
              width: double.infinity,
              height: 200.h,
              indicatorColor: AppColors.primaryColor,
              initialPage: 0,
              indicatorBottomPadding: 15.h,
              indicatorPadding: 8.w,
              indicatorRadius: 5.r,
              indicatorBackgroundColor: AppColors.whiteColor,
              autoPlayInterval: 3000,
              isLoop: true,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      AppAssets.advertiseOne,
                      fit: BoxFit.cover,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      AppAssets.advertiseTwo,
                      fit: BoxFit.cover,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      AppAssets.advertiseThree,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            SizedBox(height: 24.h),
            itemAndViewAll(title: 'Category', onViewAllPressed: () {}),
            gridViewWidget(),
            itemAndViewAll(title: 'Brands', onViewAllPressed: () {}),
            gridViewWidget(),
          ],
        ),
      ),
    );
  }
}

Widget gridViewWidget() {
  return Container(
    color: AppColors.whiteColor,
    height: 320.h,
    child: GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return CategoryWidget();
      },
      itemCount: 17,
    ),
  );
}

Widget itemAndViewAll({
  required String title,
  required Function()? onViewAllPressed,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: AppStyles.medium18PrimaryDark,
      ),
      TextButton(
          onPressed: onViewAllPressed,
          child: Text(
            'View all',
            style: AppStyles.regular12PrimaryDark,
          ))
    ],
  );
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 140.h,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: Image.asset(
              AppAssets.advertiseTwo,
              fit: BoxFit.cover,
              width: 100.w,
              height: 100.h,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Category',
            style: AppStyles.regular14PrimaryDark,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
