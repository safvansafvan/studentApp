import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textformwidget extends StatelessWidget {
  Textformwidget(
      {super.key,
      required this.ctrl,
      required this.hinttext,
      required this.isNumber});

  final TextEditingController ctrl;
  final String hinttext;
  bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: ctrl,
        keyboardType: isNumber ? TextInputType.number : TextInputType.name,
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
