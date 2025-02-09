import 'package:flutter/material.dart';

class TheTextField extends StatelessWidget {
  final TextEditingController controller;
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLines: maxline,
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.all(size),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
