// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_authen/components/my_button.dart';
import 'package:google_authen/components/my_textfield.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in
  Future<void> signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    //try sign in
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text,);

    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        wrongEmailMessage();
        Navigator.pop(context);
      } else if(e.code == 'wrong-password'){
        wrongPasswordMessage();
        Navigator.pop(context);
      }
    }
    }
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Incorrect Email"),
        );
      },
    );
  }

  //wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Incorrect Password"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                //welcome back, you've been missed
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 50),

                //email textfield
                MyTextfield(
                  controller: emailController,
                  labelText: 'Email',
                  obscureText: false,
                ),

                //password textfield
                MyTextfield(
                  controller: passwordController,
                  labelText: "Password",
                  obscureText: true,
                ),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password?",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                //sign in button
                MyButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),

                SizedBox(height: 40),

                //or continue with
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: const Color.fromARGB(255, 65, 65, 65),
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                    Text("Or continue with"),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: const Color.fromARGB(255, 65, 65, 65),
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                //google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Lottie.asset(
                        'assets/animations/google.json',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    GestureDetector(
                      child: Lottie.asset(
                        'assets/animations/apple.json',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),

                //not a member, register
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a user?   "),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
