import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCartProducts();

  Future<Either<Failures, GetCartResponseEntity>> deleteCartProduct(
      String productId);
}
