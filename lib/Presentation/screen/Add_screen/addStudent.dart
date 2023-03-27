
// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/screen/Add_screen/widget/textformfield.dart';
import 'package:image_picker/image_picker.dart';
import '../../DB/functions/db_functions.dart';
import '../../DB/model/model_dart.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final classController = TextEditingController();
  final rollNoController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kback,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 70),
              Container(
                child: fileimage == null
                    ? Container(
                        height: 140,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('Assets/images/avater2.png'),
                          ),
                        ),
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(
                          File(fileimage!.path),
                        ),
                        
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: ElevatedButton.icon(
                    onPressed: () {
                      _imageFromGallery();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Profile')),
              ),
             Textformwidget(ctrl: nameController, hinttext: 'Name'),
             Textformwidget(ctrl: ageController, hinttext: 'Age'),
             Textformwidget(ctrl:classController , hinttext: 'Class'),
             Textformwidget(ctrl: rollNoController, hinttext: 'RollNumber'),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        onAddStudents();
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text( 'Add '),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudents() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final rollNo = rollNoController.text.trim();
    final class_ = classController.text.trim();

    if (name.isEmpty || age.isEmpty || rollNo.isEmpty || class_.isEmpty || fileimage!.path.isEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          width: 150,
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          content: Text('New Data Added'),
        ),
      );
    }
    final student = StudentModel(name: name, age: age, class_: class_, rollnumber: rollNo, photo: fileimage!.path);

    addStudent(student);
  }

  File? fileimage;

  Future<void> _imageFromGallery() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (photo == null) {
      return;
    } else {
      final photoTemp = File(photo.path);

      setState(
        () {
          fileimage = photoTemp;
        },
      );
    }
  }
}
