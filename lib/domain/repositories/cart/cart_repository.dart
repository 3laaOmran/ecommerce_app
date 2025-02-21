import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getCartProducts();

  Future<Either<Failures, GetCartResponseEntity>> deleteCartProduct(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountCartProduct(
      String productId, int count);
}
