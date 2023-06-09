import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salty Test',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Sizer(
        builder: (context, orientation, deviceType) => LoginPage(),
      ),
    );
  }
}
