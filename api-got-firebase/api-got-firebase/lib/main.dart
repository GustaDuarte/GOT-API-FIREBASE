import 'package:api_rick_morty/firebase_options.dart';
import 'package:api_rick_morty/models/character.dart';
import 'package:api_rick_morty/screen/home_screen.dart';
import 'package:api_rick_morty/screen/login_screen.dart';
import 'package:api_rick_morty/services/character_service.dart';
import 'package:api_rick_morty/services/firebase/auth/firebase_auth_service.dart';
import 'package:api_rick_morty/widgets/list_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'models/user_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String newFilter = "";



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitializeApp()
    );
  }
}


class InitializeApp extends StatelessWidget {
  final FirebaseAuthService _auth = FirebaseAuthService();

  InitializeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: _auth.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return LoginPage();
      }, // Correção: fechamento do builder
    ); // Correção: fechamento do StreamBuilder
  }
}

