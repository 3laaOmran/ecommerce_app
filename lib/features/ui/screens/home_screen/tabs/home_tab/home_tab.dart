import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/domain/entities/category_or_brand_response_entity.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final cubit = getIt<HomeTabCubit>()..getAllCategoriesAndBrands();

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
            BlocBuilder<HomeTabCubit, HomeTabStates>(
              bloc: cubit,
              builder: (context, state) {
                if (state is HomeTabLoadingState) {
                  return SizedBox(
                    height: 335.h,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                } else if (state is HomeTabSuccessState) {
                  return cubit.categoriesList.isNotEmpty
                      ? gridViewWidget(categoryList: cubit.categoriesList)
                      : SizedBox(
                          height: 335.h,
                          child: Center(
                              child: Text(
                            'Some Thing Went Wrong',
                            style: AppStyles.medium18PrimaryDark,
                          )));
                } else if (state is HomeTabErrorState) {
                  return SizedBox(
                      height: 335.h,
                      child: Center(
                          child: Text(
                        state.errors.errorMsg,
                        style: AppStyles.medium18PrimaryDark,
                      )));
                }
                return Container();
              },
            ),
            itemAndViewAll(title: 'Brands', onViewAllPressed: () {}),
            BlocBuilder<HomeTabCubit, HomeTabStates>(
              bloc: cubit,
              builder: (context, state) {
                if (state is HomeTabLoadingState) {
                  return SizedBox(
                    height: 335.h,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                } else if (state is HomeTabSuccessState) {
                  return cubit.brandsList.isNotEmpty
                      ? gridViewWidget(brandList: cubit.brandsList)
                      : SizedBox(
                          height: 335.h,
                          child: Center(
                              child: Text(
                            'Some Thing Went Wrong',
                            style: AppStyles.medium18PrimaryDark,
                          )));
                } else if (state is HomeTabErrorState) {
                  return SizedBox(
                      height: 335.h,
                      child: Center(
                          child: Text(
                        state.errors.errorMsg,
                        style: AppStyles.medium18PrimaryDark,
                      )));
                }
                return Container();
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

Widget gridViewWidget(
    {List<CategoryOrBrandEntity>? categoryList,
    List<CategoryOrBrandEntity>? brandList}) {
  return Container(
    color: AppColors.whiteColor,
    height: 335.h,
    child: GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return categoryList != null
            ? CategoryWidget(
                categoryOrBrandEntity: categoryList[index],
              )
            : BrandWidget(
                categoryOrBrandEntity: brandList![index],
              );
      },
      itemCount: categoryList != null ? categoryList.length : brandList!.length,
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
  const CategoryWidget({super.key, required this.categoryOrBrandEntity});

  final CategoryOrBrandEntity categoryOrBrandEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CachedNetworkImage(
            height: 100.h,
            fit: BoxFit.fill,
            width: 100.w,
            imageUrl: categoryOrBrandEntity.image ?? '',
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            )),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 38,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          categoryOrBrandEntity.name ?? '',
          style: AppStyles.regular14PrimaryDark,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 2,
        )
      ],
    );
  }
}

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key, required this.categoryOrBrandEntity});

  final CategoryOrBrandEntity categoryOrBrandEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.primaryColor,
          )),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: CachedNetworkImage(
                height: 100.h,
                fit: BoxFit.fill,
                width: 100.w,
                imageUrl: categoryOrBrandEntity.image ?? '',
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 38,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                categoryOrBrandEntity.name ?? '',
                style: AppStyles.regular12PrimaryDark,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ))),
        ],
      ),
    );
  }
}
