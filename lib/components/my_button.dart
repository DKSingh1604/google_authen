// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          )),
        ),
      ),
    );
  }
}
