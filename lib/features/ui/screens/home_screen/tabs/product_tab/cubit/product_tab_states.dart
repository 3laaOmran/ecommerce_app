import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';

abstract class ProductTabStates {}

class GetAllProductsLoadingState extends ProductTabStates {}

class GetAllProductsErrorState extends ProductTabStates {
  Failures errors;

  GetAllProductsErrorState({required this.errors});
}

class GetAllProductsSuccessState extends ProductTabStates {
  ProductResponseEntity productResponseEntity;

  GetAllProductsSuccessState({required this.productResponseEntity});
}
