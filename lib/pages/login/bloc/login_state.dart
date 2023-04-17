import 'package:equatable/equatable.dart';
import 'package:salty_flutter_test/model/token_model.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final TokenModel token;

  LoginSuccessState({required this.token});
}

class LoginFailedState extends LoginState {
  final String message;

  LoginFailedState({required this.message});
}
