// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // register
  void registerUser() async{
    //get auth service
    final authService = AuthService();

    //check if passwords match -> create user
    if(passwordController.text == confirmPasswordController.text){
      try{
        await authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
      }catch(e){
        //display any errors
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }else{
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Passwords doesn't match!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),

              //app name
              Text(
                "Let's create an account for you!",
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary
                ),
              ),

              const SizedBox(height: 50),

              //email textfield
              MyTextfield(hintText: "Email", obscureText: false, controller: emailController),

              const SizedBox(height: 10),

              //password textfield
              MyTextfield(hintText: "Password", obscureText: true, controller: passwordController),

              const SizedBox(height: 10),

              //confirm password textfield
              MyTextfield(hintText: "Confirm Password", obscureText: true, controller: confirmPasswordController),

              const SizedBox(height: 25),

              //register button
              MyButton(text: "Register", onTap: registerUser),

              const SizedBox(height: 10),

              //don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text("Login here", style: TextStyle(
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
    );
  }
}