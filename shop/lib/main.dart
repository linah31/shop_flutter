import 'package:flutter/material.dart';
import 'package:shop/screens/signup.dart';

void main()=> runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        title: "My Flutter App",
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: SignUp()
    );
  }
}

