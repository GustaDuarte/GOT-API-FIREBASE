import 'package:api_rick_morty/screen/home_screen.dart';
import 'package:api_rick_morty/screen/register_screen.dart';
import 'package:api_rick_morty/utils/results.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../services/firebase/auth/firebase_auth_service.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController  _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16),
      child: StreamBuilder<Results>(
        stream: _auth.resultsLogin,
        builder: (context, snapshot){
           ErrorResult result = ErrorResult(code: "");
          if (snapshot.data is ErrorResult){
            result = snapshot.data as ErrorResult;
          }
          if (snapshot.data is LoadingResult){
            return const Center(child: CircularProgressIndicator());
          }

          if(snapshot.data is SuccessResult){
            WidgetsBinding.instance.addPostFrameCallback((_){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),
              ),
              );
            });
          }

          return Column(
            children: [
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email')
              ),
              TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password')
              ),
              ElevatedButton(onPressed: () {
                final String email = _emailController.text;
                final String password = _passwordController.text;
                _auth.signIn(email, password);
              }, child: const Text("Logar")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                  }, child: const Text("Registre-se")
              ),
              if (result.code.isNotEmpty)
                switch(result.code){
                "invalid-email" => Text("Autenticação invalida"),
                "wrong-password" => Text("Autenticação invalida"),
                _ => Text("Error")
                }
            ],
          );
        },
      ),
    ),
    );
  }
}
