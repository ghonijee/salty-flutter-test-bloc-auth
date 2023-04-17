import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_flutter_test/model/token_model.dart';
import 'package:salty_flutter_test/pages/login/bloc/login_event.dart';
import 'package:salty_flutter_test/pages/login/bloc/login_state.dart';
import 'package:salty_flutter_test/services/auth_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _service;

  LoginBloc({required AuthService service})
      : _service = service,
        super(LoginInitState()) {
    on<LoginSubmitted>((event, emit) async {
      var result = await _service.login(event.model);
      if (result.status!) {
        emit(LoginSuccessState(token: result.data));
      } else {
        emit(LoginFailedState(message: result.message ?? "Login Failed"));
      }
    });
  }
}
