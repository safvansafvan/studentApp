
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EditStudent extends StatefulWidget {
  final String name;

  final String class_;

  final String age;

  final String rollno;

  final int index;

  const EditStudent({
    super.key,
    required this.name,
    required this.class_,
    required this.age,
    required this.rollno,
    required this.index,
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
      appBar: AppBar(
        title: const Text('Edit Student'),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameOfStudent,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: classOfStudent,
                    decoration: const InputDecoration(
                      hintText: 'class',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLength: 3,
                    controller: ageOfStudent,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLength: 3,
                    controller: rollNoOfStudent,
                    decoration: const InputDecoration(
                      hintText: 'roll no',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
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
                ),
              ],
            ),
          ),
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
