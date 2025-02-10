import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/register_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/auth/auth_repository.dart';
import 'package:ecommerce_app/domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoterDataSource authRemoterDataSource;

  AuthRepositoryImpl({required this.authRemoterDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phoneNumber) async {
    var either = await authRemoterDataSource.register(
        name, email, password, rePassword, phoneNumber);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
