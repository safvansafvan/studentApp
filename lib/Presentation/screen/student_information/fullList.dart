// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/screen/student_information/widget/textwidget.dart';
import 'package:flutter_application_1/Presentation/widgets/appbar.dart';

class FullDetails extends StatelessWidget {
  final String name;
  final String class_;
  final String age;
  final String rollno;
  final String photo;

  const FullDetails(
      {super.key,
      required this.name,
      required this.age,
      required this.class_,
      required this.rollno,
      required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AppBarWidget(
              titles: 'Student Informations',
              leading: Icons.arrow_back,
              trailing: Icons.error),
          const SizedBox(
            height: 50,
          ),
          CircleAvatar(
            radius: 82,
            child: CircleAvatar(
              backgroundImage: FileImage(File(photo)),
              radius: 80,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  TextWidget(titlevalue: name, title: 'Name'),
                  const SizedBox(height: 20),
                  TextWidget(titlevalue: age, title: 'Age'),
                  const SizedBox(height: 20),
                  TextWidget(titlevalue: class_, title: 'Class'),
                  const SizedBox(height: 20),
                  TextWidget(titlevalue: rollno, title: 'Roll Number'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
