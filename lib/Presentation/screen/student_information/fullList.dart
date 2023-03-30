// ignore_for_file: file_names

import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
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
                  Text(
                    'NAME :  $name'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'CLASS :  $class_',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'AGE : $age',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ROLL NO : $rollno',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
