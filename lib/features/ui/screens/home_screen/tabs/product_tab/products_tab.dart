import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_cubit.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/product_item.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});

  final cubit = getIt<ProductTabCubit>()..getAllProducts();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabCubit, ProductTabStates>(
      bloc: cubit,
      builder: (context, state) {
        if (state is GetAllProductsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (state is GetAllProductsErrorState) {
          return Center(
            child: Text(
              state.errors.errorMsg,
              style: AppStyles.semiBold20Primary,
            ),
          );
        } else if (state is GetAllProductsSuccessState) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.only(bottom: 20.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 2 / 3.08.h),
                    itemCount: state.productResponseEntity.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.productRoute,
                                arguments:
                                    state.productResponseEntity.data![index]);
                          },
                          child: ProductItem(
                            product: state.productResponseEntity.data![index],
                          ));
                    }),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
