import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/login_response_entity.dart';
import 'package:ecommerce_app/domain/entities/register_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phoneNumber);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
