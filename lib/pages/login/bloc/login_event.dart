import 'package:salty_flutter_test/model/login_auth_model.dart';

abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final LoginAuthModel model;

  LoginSubmitted(this.model);
}
