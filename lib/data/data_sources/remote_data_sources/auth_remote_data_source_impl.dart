import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/models/register_responce_dm.dart';
import 'package:ecommerce_app/domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoterDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoterDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  // only place to use DM model
  Future<Either<Failures, RegisterResponseDM>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phoneNumber) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.postData(endPoint: EndPoints.signUp, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phoneNumber
        });
        var registerResponse = RegisterResponseDM.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMsg: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMsg: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(ServerError(errorMsg: e.toString()));
    }
  }
}
