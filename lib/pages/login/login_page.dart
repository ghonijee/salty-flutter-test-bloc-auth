import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_flutter_test/pages/login/bloc/login_bloc.dart';
import 'package:salty_flutter_test/pages/login/login_screen.dart';
import 'package:salty_flutter_test/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(service: AuthService()),
      child: LoginScreen(),
    );
  }
}
