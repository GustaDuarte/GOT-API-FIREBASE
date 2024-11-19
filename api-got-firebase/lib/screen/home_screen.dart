import 'package:api_rick_morty/screen/login_screen.dart';
import 'package:api_rick_morty/services/firebase/auth/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:api_rick_morty/widgets/list_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  String _filter = "";

  void setFilter(String changeFilter) {
    setState(() {
      _filter = changeFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personagens"),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginPage()));
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setFilter(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Filtro",
              ),
            ),
          ),
          ListBuilder(filter: _filter),
        ],
      ),
    );
  }
}
