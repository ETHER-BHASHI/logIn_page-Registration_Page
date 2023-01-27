import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/my_textfield.dart';
import '../components/tilemaster.dart';
import '../services/authService.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  // sign user in method

  Future<void> signUserUp() async {

    //show loading circle
    showDialog(context: context,builder:(context){
      return const Center(
        child:CircularProgressIndicator(),
      );
    },
    );
    //try sign in
    try {
      //check 9f passwd is confirmed
      if (passwordController.text == confirmpasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword
          (email: emailController.text,
          password: passwordController.text,);

    }else{
        //show error msg
        showErrorMessage('Passwords dont match');
      }
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

  void showErrorMessage(String message){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
              title:Center(child:
              Text(message,
                style: TextStyle(color: Colors.white),
              ),
              ),
          );
        },
    );
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
                //const SizedBox(height: 1),

                // logo
                Icon(Icons.android,
                  size: 100,
                ),
                Text(
                  'Your Friends for real\n Register!<3',textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                    fontSize: 16,
                  ),

            //const SizedBox(height: 5),

            // welcome back, you've been missed!

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

                MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'Comfirm Password',
                  obscureText: true,
                ),


                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text:'Sign Up',
                  onTap: signUserUp,
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

                const SizedBox(height: 20),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    // google button
                    SquareTile(
                        onTap:()=>AuthService().signInWithGoogle(),
                    imagePath: 'lib/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(
                        onTap:(){},
                        imagePath: 'lib/images/facebook.png')
                  ],
                ),

                const SizedBox(height: 25),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[850]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap:widget.onTap,
                      child: const Text(
                        'LogIn now',
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