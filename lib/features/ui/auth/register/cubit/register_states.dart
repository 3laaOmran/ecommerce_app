import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/register_response_entity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class ChangePasswordVisibilityState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  Failures failures;

  RegisterErrorState({required this.failures});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;

  RegisterSuccessState({required this.registerResponseEntity});
}
