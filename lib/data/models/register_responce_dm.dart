import 'package:ecommerce_app/domain/entities/register_response_entity.dart';

class RegisterResponseDM extends RegisterResponseEntity {
  RegisterResponseDM({
    super.message,
    super.userDM,
    super.statusMsg,
    super.token,
  });

  RegisterResponseDM.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    userDM = json['user'] != null ? UserDM.fromJson(json['user']) : null;
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
