import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/add_to_cart_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(
      String productId) async {
    return await homeRepository.addToCart(productId);
  }
}
