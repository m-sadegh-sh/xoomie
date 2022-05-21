import 'package:xoomie/src/base/models/model_base.dart';

class UserModel extends ModelBase {
  final String email;

  UserModel({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}
