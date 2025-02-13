class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
}

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
