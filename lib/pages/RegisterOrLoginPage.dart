import 'package:flutter/cupertino.dart';
import 'package:project_2/pages/login.dart';

import 'RegisterPage.dart';

class RegisterOrLoginPage extends StatefulWidget {
  const RegisterOrLoginPage({Key? key}) : super(key: key);

  @override
  State<RegisterOrLoginPage> createState() => _RegisterOrLoginPageState();
}

class _RegisterOrLoginPageState extends State<RegisterOrLoginPage> {
  //initially show login page
  bool showLoginPage=true;

  //toogle between login and register page
  void toggPages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context)  {
    if (showLoginPage){
      return LoginPage(onTap: toggPages,);
    }else{
      return RegisterPage(
          onTap:toggPages,
      );
    }
  }
}
