import 'package:hive_flutter/adapters.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String proffession;

  UserModel(
      this.name, this.email, this.phoneNumber, this.password, this.proffession);
}
