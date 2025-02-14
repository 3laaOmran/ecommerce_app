import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/category_or_brand_response_entity.dart';
import '../../../entities/product_response_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();
}
