import 'package:youapp/features/auth/domain/entities/user_entity.dart';

// ignore: must_be_immutable
class UserModel extends UserEntity {
  UserModel({
    String? email,
    String? username,
    String? password,
  }) : super(
          email: email,
          username: username,
          password: password,
        );

  // factory UserModel.fromJson(Map<dynamic, dynamic> json) {
  //   return UserModel(
  //     email: json['email'],
  //     password: json['password'],
  //   );
  // }
}
