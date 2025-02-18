import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/models/get_cart_response_DM.dart';
import 'package:ecommerce_app/domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/cashe/shared_preferences_utils.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDm>> getCartProducts() async {
    var token = SharedPreferencesUtils.getData(key: 'token');
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager
            .getData(endPoint: EndPoints.cart, headers: {'token': token});

        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(errorMsg: getCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }
}
