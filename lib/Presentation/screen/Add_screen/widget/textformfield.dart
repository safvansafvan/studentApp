import 'package:flutter/material.dart';

class Textformwidget extends StatelessWidget {
  const Textformwidget({super.key, required this.ctrl, required this.hinttext});

  final TextEditingController ctrl;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: ctrl,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          hintText: hinttext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
