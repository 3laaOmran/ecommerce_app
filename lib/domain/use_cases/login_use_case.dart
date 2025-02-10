import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/login_response_entity.dart';
import 'package:ecommerce_app/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  // function to do what i want (invoke - call -execute).
  Future<Either<Failures, LoginResponseEntity>> invoke(
    String email,
    String password,
  ) async {
    return authRepository.login(
      email,
      password,
    );
  }
}
