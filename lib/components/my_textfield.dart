// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String labelText;
  final bool obscureText;
  const MyTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
