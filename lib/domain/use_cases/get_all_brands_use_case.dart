import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../entities/category_or_brand_response_entity.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;

  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() async {
    return await homeRepository.getAllBrands();
  }
}
