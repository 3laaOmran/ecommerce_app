import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                  child: CachedNetworkImage(
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: product.imageCover ?? '',
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
                Padding(
                  padding: EdgeInsets.only(top: 5.h, right: 5.w),
                  child: Image.asset(
                    AppAssets.selectedFavouriteIcon,
                    width: 30.w,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      product.title ?? '',
                      maxLines: 1,
                      style: AppStyles.regular14PrimaryDark,
                    ),
                    Row(
                      children: [
                        AutoSizeText(
                          'EGP ${product.price}',
                          style: AppStyles.regular14PrimaryDark,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            '${(product.price ?? 0) * 2} EGP',
                            style: AppStyles.regular11DiscountColor.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.primaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AutoSizeText(
                          'Review (${product.ratingsAverage})',
                          style: AppStyles.regular14PrimaryDark,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.yellowColor,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.add_circle_outlined,
                            color: AppColors.primaryColor,
                            size: 30,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
