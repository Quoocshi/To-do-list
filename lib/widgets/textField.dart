import 'package:flutter/material.dart';

class TheTextField extends StatelessWidget {
  final dynamic controller;
  final String labelText;
  final double size;
  final int maxline;
  const TheTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.size,
    required this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLines: maxline,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixText: labelText,
          prefixStyle: const TextStyle(color: Colors.white),

          contentPadding: EdgeInsets.all(size),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: const Color(0xFF7E64FF),
          border: InputBorder.none,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(9),
          // )
        ),
      ),
    );
  }
}
