class RegisterResponseEntity {
  String? message;
  UserEntity? userDM;
  String? token;
  String? statusMsg;

  RegisterResponseEntity({
    this.statusMsg,
    this.message,
    this.userDM,
    this.token,
  });
}

class UserEntity {
  String? name;
  String? email;

  UserEntity({
    this.name,
    this.email,
  });
}
