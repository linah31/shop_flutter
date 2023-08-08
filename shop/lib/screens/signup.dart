
import 'dart:ffi';

import 'package:flutter/material.dart';

import '../const/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}
final GlobalKey <FormState> _formKey=GlobalKey <FormState>();
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText=true;
class _SignUpState extends State<SignUp> {
  void validation(){
    final FormState? _form=_formKey.currentState;
    if(_form!.validate()){
      print("yes");
    }
    else{
      print("no");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Form(
          key: _formKey,

          child: Column(
            children: <Widget>[
              Container(
                height: 220,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Register",
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      validator: (value){
                        if(value==""){
                          return "please Fill Username";
                        }
                        else if(value!.length <6){
                          return "Username is to short";
                        }

                        return "";
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                        icon: Icon(Icons.abc),
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      validator: (value){
                       if(value==""){
                          return "please Fill Email";
                        }
                       else if(!regExp.hasMatch(value!)){
                         return "email invalid";

                       }
                        return "";
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value){
                        if(value==""){
                          return"please Fill password";
                        }
                        else if(value!.length<8){
                          return "password is too short";
                        }
                        return"";
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                               obserText=!obserText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                           obserText==true? Icons.visibility:Icons.visibility_off,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      validator: (value){
                        if(value==""){
                          return "please fill phone number";
                        }
                        else if(value!.length<11){
                          return "phone number must be 11 digits";
                        }
                        return"";
                      },
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        icon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                        height: 45,
                        child: RaisedButton(
                            child: Text("Register"),
                            color: Colors.indigo[400],
                            onPressed: () {
                              validation();
                            })),
                    Row(
                      children: [
                        Text("Have an account!"),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
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
