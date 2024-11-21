import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("User: ${FirebaseAuth.instance.currentUser?.email}"),
      ),
    );
  }
}
