import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2/services/authService.dart';

import '../components/button.dart';
import '../components/my_textfield.dart';
import '../components/tilemaster.dart';


class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method

  Future<void> signUserIn() async {

    //show loading circle
    showDialog(context: context,builder:(context){
      return const Center(
        child:CircularProgressIndicator(),
      );
    },
    );
    //try sign in
    try{
   await FirebaseAuth.instance.signInWithEmailAndPassword
     (email: emailController.text,
       password: passwordController.text,);

   //pop the loading circle
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
  Navigator.pop(context);
  if (e.code == 'user-not-found') {
  wrongEmailMessage();
  } else if (e.code == 'wrong-password') {
  wrongPasswordMessage();
  }
  }
}
//email poping msg
  void wrongEmailMessage(){
    showDialog(
        context: context,
        builder: (context){
          return const AlertDialog( backgroundColor: Colors.deepPurple,
            title:Center(child:
              Text('Oops, wrong email',
              style: TextStyle(color: Colors.white),
          ),
            ),
          );
        },
    );
  }

  //passwd poping msg
  void wrongPasswordMessage(){
    showDialog(
      context: context,
      builder: (context){
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title:Center(child:
            Text('Oops, wrong password!',
            style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.deepPurple[300],

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding :EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // logo

              Icon(Icons.android,
              size: 150,),

                const SizedBox(height: 5),

                // welcome back, you've been missed!
                Text(
                  'Your Friends for real\n\t\t\t LogIN to DigIN!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[850]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),

                const SizedBox(height: 30),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[850]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                      onTap:()=>AuthService().signInWithGoogle(),
                        imagePath: 'lib/images/google.png'),

                    SizedBox(width: 20),

                    // apple button
                    SquareTile(
                        onTap:(){},
                        imagePath: 'lib/images/facebook.png')
                  ],
                ),

                const SizedBox(height: 40),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[850]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap:widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}