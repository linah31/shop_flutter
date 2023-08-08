import 'package:flutter/material.dart';
import 'package:shop/screens/signup.dart';

import '../const/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginState extends State<Login> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("no");
    } else {
      print("yes");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 350,
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                color: AppColors.lightblue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightpurble),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "please Fill Email";
                        } else if (!regExp.hasMatch(value!)) {
                          return "email invalid";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        icon: Icon(
                          Icons.email,
                          color: AppColors.lightpurble,
                        ),
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: AppColors.lightpurble),
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value) {
                        if (value == "") {
                          return "please Fill password";
                        } else if (value!.length < 8) {
                          return "password is too short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(
                          Icons.password,
                          color: AppColors.lightpurble,
                        ),
                        border: OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              obserText = !obserText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            obserText == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.lightpurble,
                          ),
                        ),
                        hintStyle: TextStyle(color: AppColors.lightpurble),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(
                          child: Text("Login",
                              style: TextStyle(color: AppColors.lightblue)),
                          color: AppColors.lightpurble,
                          onPressed: () {
                            validation();
                          }),
                    ),
                    Row(
                      children: [
                        Text("I don't have an account!"),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => SignUp()),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: AppColors.darkcyan,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
