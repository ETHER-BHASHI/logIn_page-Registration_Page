import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2/pages/home.dart';
import 'package:project_2/pages/login.dart';

import 'RegisterOrLoginPage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context,snapshot){
          // user is logged in
          if (snapshot.hasData){
            return HomePage();
          }
          //user is not loggedin
          else{
            return RegisterOrLoginPage();
          }
        },
      ),
    );
  }}

