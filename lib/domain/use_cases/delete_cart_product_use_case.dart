import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';

@injectable
class DeleteCartProductUseCase {
  CartRepository cartRepository;

  DeleteCartProductUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId) async {
    return await cartRepository.deleteCartProduct(productId);
  }
}
