import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/login_response_entity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangeLoginPasswordVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures failures;

  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}
