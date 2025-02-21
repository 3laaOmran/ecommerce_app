import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';

abstract class CartStates {}

class GetCartProductsLoadingState extends CartStates {}

class GetCartProductsErrorState extends CartStates {
  Failures errors;

  GetCartProductsErrorState({required this.errors});
}

class GetCartProductsSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  GetCartProductsSuccessState({required this.getCartResponseEntity});
}

class DeleteCartProductLoadingState extends CartStates {}

class DeleteCartProductErrorState extends CartStates {
  Failures errors;

  DeleteCartProductErrorState({required this.errors});
}

class DeleteCartProductSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  DeleteCartProductSuccessState({required this.getCartResponseEntity});
}
