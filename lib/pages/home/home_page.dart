import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_flutter_test/pages/home/bloc/home_bloc.dart';
import 'package:salty_flutter_test/pages/home/home_screen.dart';
import 'package:salty_flutter_test/services/user_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(create: (context) => HomeBloc(UserService()), child: HomeScreen());
  }
}
