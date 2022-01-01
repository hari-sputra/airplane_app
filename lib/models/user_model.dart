import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id, name, email, hobby;
  final int balance;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.hobby = '',
    this.balance = 0,
  });

  @override
  List<Object?> get props => [id, email, name, hobby, balance];
}
