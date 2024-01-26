import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  String? email;
  String? password;
  String? username;

  UserEntity({
    this.email,
    this.password, 
    this.username,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        username,
      ];
}
