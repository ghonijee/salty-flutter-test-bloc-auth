import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_flutter_test/model/login_auth_model.dart';
import 'package:salty_flutter_test/pages/home/home_page.dart';
import 'package:salty_flutter_test/pages/login/bloc/login_bloc.dart';
import 'package:salty_flutter_test/pages/login/bloc/login_event.dart';
import 'package:salty_flutter_test/pages/login/bloc/login_state.dart';
import 'package:salty_flutter_test/styles/base_color.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool obsecureText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      obsecureText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        } else if (state is LoginFailedState) {
          var snackBar = SnackBar(content: Text(state.message));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              width: 100.w,
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "SELAMAT DATANG",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: BaseColor.Primary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  // Email
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: BaseColor.Primary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  // Password
                  TextField(
                    controller: passwordController,
                    obscureText: obsecureText,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                obsecureText = !obsecureText;
                              });
                            },
                            child: Icon(Icons.remove_red_eye)),
                        label: Text(
                          "Password",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: BaseColor.Primary,
                                fontWeight: FontWeight.w500,
                              ),
                        )),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var data = LoginAuthModel(email: emailController.text, password: passwordController.text);
                      // print(data.toJson());
                      context.read<LoginBloc>().add(LoginSubmitted(data));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40.sp),
                      backgroundColor: BaseColor.Primary,
                    ),
                    child: Text(
                      "MASUK",
                      style: Theme.of(context).primaryTextTheme.bodyLarge,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
