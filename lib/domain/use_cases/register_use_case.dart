import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../entities/register_response_entity.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  // function to do what i want (invoke - call -execute).
  Future<Either<Failures, RegisterResponseEntity>> invoke(
      String name,
      String email,
      String password,
      String rePassword,
      String phoneNumber) async {
    return authRepository.register(
        name, email, password, rePassword, phoneNumber);
  }
}
