import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/add_to_cart_response_entity.dart';
import 'package:ecommerce_app/domain/entities/category_or_brand_response_entity.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/data_sources/remote_data_sources/home_remote_data_source.dart';
import 'package:ecommerce_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
