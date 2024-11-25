
import 'package:flutter/material.dart';

import '../services/firebase/auth/firebase_auth_service.dart';

class RegisterScreen extends StatelessWidget {

  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController  _passwordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registre-se", style: TextStyle(fontSize: 20,fontFamily: 'Got')), backgroundColor: Colors.grey),
      body: Stack(
        children: [
      Positioned.fill(
      child: Image.asset(
        'assets/images/gotimage.jpg',
        fit: BoxFit.cover,
      ),
    ),
      Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(
                    color: Colors.grey[800],
                  ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),)
              ),
              const SizedBox(height: 16),
              TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(
                    color: Colors.grey[800],
                  ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),)
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () {
                final String email = _emailController.text;
                final String password = _passwordController.text;
                _auth.register(email, password);
                Navigator.pop(context);
              }, child: const Text("Registrar-se", style: TextStyle(fontFamily: 'Got')))
            ],
          ),
        ),
       ],
      ),
    );
  }
}
