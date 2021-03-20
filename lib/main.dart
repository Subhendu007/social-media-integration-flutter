import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/loginpage': (BuildContext context) => new LoginPage(),
        '/homepage': (BuildContext context) => new HomePage(),
      },
    );
  }
}
