import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';

import '../services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login
  void login() async{
    //get instance of auth service
    final authService = AuthService();

    //try login
    try{
      await authService.loginWithEmailAndPassword(emailController.text, passwordController.text);
    }catch(e){
      //display any errors
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),

                //app name
                Text(
                  "Food Delivery App",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                //email text field
                MyTextfield(hintText: "Email", obscureText: false, controller: emailController),

                const SizedBox(height: 10),

                //password text field
                MyTextfield(hintText: "Password", obscureText: true, controller: passwordController),

                // const SizedBox(height: 10),

                // //forgot password
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text("Forgot Password?", style: TextStyle(
                //       color: Theme.of(context).colorScheme.inversePrimary
                //     ),),
                //   ],
                // ),

                const SizedBox(height: 25),

                //sign in button
                MyButton(text: "Login", onTap: login),

                const SizedBox(height: 10),

                //not a member? Register here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member? ", style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary
                    ),),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text("Register now", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
