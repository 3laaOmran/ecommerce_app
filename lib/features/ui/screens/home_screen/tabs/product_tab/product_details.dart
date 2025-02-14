import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:ecommerce_app/features/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/utils/app_colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: AppStyles.medium20PrimaryDark,
        ),
        actions: [
          ImageIcon(AssetImage(AppAssets.searchIcon)),
          SizedBox(width: 20.w),
          ImageIcon(AssetImage(AppAssets.shoppingCart)),
          SizedBox(width: 15.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: 260.h,
              indicatorColor: AppColors.primaryColor,
              initialPage: 0,
              indicatorBottomPadding: 15.h,
              indicatorPadding: 8.w,
              indicatorRadius: 5.r,
              indicatorBackgroundColor: AppColors.whiteColor,
              autoPlayInterval: 3000,
              isLoop: true,
              children: args.images!.map((image) {
                return SliderImage(imageUrl: image);
              }).toList(),
            ),
            SizedBox(height: 15.w),
            Row(
              children: [
                Expanded(
                    child: Text(
                  args.title ?? '',
                  style: AppStyles.medium18PrimaryDark,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
                SizedBox(width: 15.w),
                Text(
                  'EGP ${args.price}',
                  style: AppStyles.medium18PrimaryDark,
                ),
              ],
            ),
            SizedBox(height: 15.w),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(color: AppColors.primary300Opacity)),
                  child: Text('${args.sold} sold',
                      style: AppStyles.medium14PrimaryDark),
                ),
                SizedBox(width: 15.w),
                Icon(
                  Icons.star,
                  color: AppColors.yellowColor,
                  size: 20,
                ),
                Text(
                  '${args.ratingsAverage} (${args.ratingsQuantity})',
                  style: AppStyles.regular14PrimaryDark,
                ),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: AppColors.primaryColor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        color: AppColors.whiteColor,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text('1', style: AppStyles.medium18White),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: AppColors.whiteColor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.w),
            Text('Description', style: AppStyles.medium18PrimaryDark),
            SizedBox(height: 15.w),
            ReadMoreText(
              args.description ?? '',
              style: AppStyles.regular14PrimaryDarkLight,
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: AppColors.primaryDark,
              trimCollapsedText: 'Read More',
              trimExpandedText: ' Read Less',
              moreStyle: AppStyles.regular14PrimaryDark,
            ),
            SizedBox(
              height: 100.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text('Total Price',
                        style: AppStyles.medium18PrimaryDarkLight),
                    SizedBox(height: 15.w),
                    Text(
                      'EGP ${args.price}',
                      style: AppStyles.medium18PrimaryDark,
                    ),
                  ],
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: CustomElevatedButton(
                      radios: 30.r,
                      bgColor: AppColors.primaryColor,
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_checkout,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                          SizedBox(width: 20.w),
                          Text('Add to cart', style: AppStyles.medium20White),
                        ],
                      ),
                      buttonText: '',
                      onPressed: () {}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SliderImage extends StatelessWidget {
  const SliderImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: AppColors.primary300Opacity)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: CachedNetworkImage(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: imageUrl,
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
        Padding(
          padding: EdgeInsets.only(top: 10.h, right: 10.w),
          child: Image.asset(
            AppAssets.selectedFavouriteIcon,
            width: 35.w,
          ),
        )
      ],
    );
  }
}
