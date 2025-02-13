import 'package:ecommerce_app/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold((error) {
        emit(LoginErrorState(failures: error));
      }, (response) {
        emit(LoginSuccessState(loginResponseEntity: response));
      });
    }
  }

  void changePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    emit(ChangeLoginPasswordVisibilityState());
  }
}
