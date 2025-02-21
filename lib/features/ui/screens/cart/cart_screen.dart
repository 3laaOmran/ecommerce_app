import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/cashe/shared_preferences_utils.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/flutter_toast.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/features/ui/screens/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/ui/screens/cart/cubit/cart_states.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_cubit.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:ecommerce_app/features/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  // final cubit = getIt<CartCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: AppStyles.medium20PrimaryDark,
        ),
        actions: [
          ImageIcon(AssetImage(AppAssets.searchIcon)),
          SizedBox(width: 15.w),
          BlocBuilder<ProductTabCubit, ProductTabStates>(
            builder: (context, state) {
              return Badge(
                alignment: Alignment.topRight,
                backgroundColor: AppColors.greenColor,
                label: Text(
                  ProductTabCubit.get(context).numOfCartItems == 0
                      ? SharedPreferencesUtils.getData(key: 'numItems')
                          .toString()
                      : ProductTabCubit.get(context).numOfCartItems.toString(),
                  style: AppStyles.regular11White,
                ),
                child: ImageIcon(
                  AssetImage(AppAssets.shoppingCart),
                ),
              );
            },
          ),
          SizedBox(width: 18.w),
        ],
      ),
      body: BlocListener<CartCubit, CartStates>(
        listener: (context, state) {
          if (state is DeleteCartProductSuccessState) {
            ShowToast.toastMsg(
                msg: 'Deleted Successfully',
                bgColor: AppColors.greenColor,
                textColor: AppColors.whiteColor);
          }
        },
        child: BlocBuilder<CartCubit, CartStates>(
          bloc: CartCubit.get(context)..getCartProducts(),
          builder: (context, state) {
            if (state is GetCartProductsSuccessState ||
                state is DeleteCartProductSuccessState ||
                state is UpdateCountInCartSuccessState) {
              return Stack(
              children: [
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 130.h),
                    itemCount: CartCubit.get(context).cartItems.length,
                    itemBuilder: (context, index) => CartItem(
                      cartDataEntity: CartCubit.get(context).cartItems[index],
                    ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    decoration: BoxDecoration(color: AppColors.whiteColor),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Total Price',
                              style: AppStyles.medium18PrimaryDarkLight,
                            ),
                            Text(
                                'EGP ${state is GetCartProductsSuccessState ? state.getCartResponseEntity.data!.totalCartPrice : state is DeleteCartProductSuccessState ? state.getCartResponseEntity.data!.totalCartPrice : state is UpdateCountInCartSuccessState ? state.getCartResponseEntity.data!.totalCartPrice : 0.0}',
                                style: AppStyles.medium18PrimaryDark,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 33.w,
                        ),
                        Expanded(
                          child: CustomElevatedButton(
                              bgColor: AppColors.primaryColor,
                              radios: 25.r,
                              buttonWidget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Check Out',
                                    style: AppStyles.medium18White,
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: AppColors.whiteColor,
                                    size: 25,
                                  )
                                ],
                              ),
                              buttonText: '',
                              onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (state is GetCartProductsErrorState) {
            return Center(
              child: Text(
                'Something Went Wrong',
                style: AppStyles.medium20PrimaryDark,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
        },
      ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartDataEntity});

  final GetCartProductEntity cartDataEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary300Opacity),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary300Opacity),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                height: 140.h,
                width: 130.w,
                fit: BoxFit.fill,
                imageUrl: cartDataEntity.product!.imageCover ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiI76D9VIJtd-mUicPtv07vgr1ZcKobACqyg&s',
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        cartDataEntity.product!.title ?? '',
                        style: AppStyles.medium18PrimaryDark,
                      )),
                      IconButton(
                          onPressed: () {
                            CartCubit.get(context).deleteCartProduct(
                                cartDataEntity.product?.id ?? '');
                          },
                          icon: Icon(
                            CupertinoIcons.delete,
                            color: AppColors.primaryColor,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'EGP ${cartDataEntity.price}',
                        style: AppStyles.medium18PrimaryDark,
                      )),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 13.w, vertical: 5.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: AppColors.primaryColor),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                int count = cartDataEntity.count!.toInt();
                                count--;
                                CartCubit.get(context).updateCountInCart(
                                    cartDataEntity.product?.id ?? '', count);
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                color: AppColors.whiteColor,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(cartDataEntity.count.toString(),
                                  style: AppStyles.medium18White),
                            ),
                            InkWell(
                              onTap: () {
                                int count = cartDataEntity.count!.toInt();
                                count++;
                                CartCubit.get(context).updateCountInCart(
                                    cartDataEntity.product?.id ?? '', count);
                              },
                              child: Icon(
                                Icons.add_circle_outline,
                                color: AppColors.whiteColor,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
