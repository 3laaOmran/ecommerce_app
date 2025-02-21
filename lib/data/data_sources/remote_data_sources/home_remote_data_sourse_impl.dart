import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/cashe/shared_preferences_utils.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/models/add_to_cart_response_DM.dart';
import 'package:ecommerce_app/data/models/category_or_brand_response_DM.dart';
import 'package:ecommerce_app/data/models/product_response_DM.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/data_sources/remote_data_sources/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllCategories);

        var categoryResponse =
            CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMsg: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllBrands() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllBrands);

        var brandResponse = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorMsg: brandResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllProducts);

        var productResponse = ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMsg: productResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToCartResponseDm>> addToCart(
      String productId) async {
    var token = SharedPreferencesUtils.getData(key: 'token');
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.postData(endPoint: EndPoints.cart, body: {
          'productId': productId,
        }, headers: {
          'token': token
        });

        var addToCartResponse = AddToCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToCartResponse);
        } else {
          return Left(ServerError(errorMsg: addToCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }
}
