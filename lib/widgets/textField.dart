import 'package:flutter/material.dart';

class TheTextField extends StatelessWidget {
  final dynamic controller;
  final String hintext;
  const TheTextField(
      {super.key, required this.controller, required this.hintext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
