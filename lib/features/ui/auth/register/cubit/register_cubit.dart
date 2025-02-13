import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/use_cases/register_use_case.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase})
      : super(RegisterInitialState());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;
  bool isRePasswordObscure = true;

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text);
      either.fold((error) {
        emit(RegisterErrorState(failures: error));
      }, (response) {
        emit(RegisterSuccessState(registerResponseEntity: response));
      });
    }
  }

  void changePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    emit(ChangePasswordVisibilityState());
  }

  void changeRePasswordVisibility() {
    isRePasswordObscure = !isRePasswordObscure;
    emit(ChangePasswordVisibilityState());
  }
}
