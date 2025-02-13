import 'package:ecommerce_app/domain/entities/login_response_entity.dart';

class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({
    super.message,
    super.user,
    super.token,
  });

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserDM extends UserEntity {
  UserDM({
    super.name,
    super.email,
    this.role,
  });

  UserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
