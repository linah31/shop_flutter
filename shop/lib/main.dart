import 'package:flutter/material.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/screens/login.dart';
import 'package:shop/screens/signup.dart';

void main()=> runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        title: "My Flutter App",
        themeMode: ThemeMode.system,
        theme: new ThemeData(scaffoldBackgroundColor: AppColors.lightblue),

        debugShowCheckedModeBanner: false,
        home: Login()
    );
  }
}

