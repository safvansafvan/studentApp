
// ignore_for_file: file_names


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/widgets/appbar.dart';

class EditStudent extends StatefulWidget {
  final String name;

  final String class_;

  final String age;

  final String rollno;

  final int index;

  final String photo;


  const EditStudent({
    super.key,
    required this.name,
    required this.class_,
    required this.age,
    required this.rollno,
    required this.index,
    required this.photo
  });

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {


  TextEditingController nameOfStudent = TextEditingController();

  TextEditingController classOfStudent = TextEditingController();

  TextEditingController ageOfStudent = TextEditingController();

  TextEditingController rollNoOfStudent = TextEditingController();


  @override
  void initState() {
    super.initState();

    nameOfStudent = TextEditingController(text: widget.name);

    classOfStudent = TextEditingController(text: widget.class_);

    ageOfStudent = TextEditingController(text: widget.age);

    rollNoOfStudent = TextEditingController(text: widget.rollno);

  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const AppBarWidget(titles: 'Edit Details', leading: Icons.arrow_back, trailing: Icons.error),
            const SizedBox(height: 10,),
             CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(
                        File(widget.photo),
                      )),
            SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameOfStudent,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                   const SizedBox(height: 15,),
                    TextFormField(
                      controller: classOfStudent,
                      decoration: const InputDecoration(
                        hintText: 'class',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      maxLength: 3,
                      keyboardType:TextInputType.number,
                      controller: ageOfStudent,
                      decoration: const InputDecoration(
                        hintText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      maxLength: 3,
                        keyboardType:TextInputType.number,
                      controller: rollNoOfStudent,
                      decoration: const InputDecoration(
                        hintText: 'roll no',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton.icon(
                        style: const ButtonStyle(),
                        onPressed: () {
                          // EditSave();
                          editDialouge();
              
                          Navigator.of(context).pop();
                        },
                        label: const Text('Confirm edit'),
                        icon: const Icon(
                          Icons.check,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  editDialouge() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.lightGreen,
        content: Text('data updated'),
      ),
    );
  }
}
