import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/DB/model/model_dart.dart';
import 'package:flutter_application_1/Presentation/screen/Add_screen/widget/textformfield.dart';
import 'package:flutter_application_1/Presentation/widgets/appbar.dart';
import 'package:flutter_application_1/Presentation/widgets/snack_bar.dart';
import 'package:flutter_application_1/controller/provider/student_provider.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final studentprovider =
        Provider.of<StudentProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      studentprovider.fileimage = null;
    });
    return Consumer<StudentProvider>(builder: (context, value, _) {
      return Form(
        key: value.formkey,
        child: ListView(
          children: [
            Column(
              children: [
                const AppBarWidget(
                    titles: 'Add Student Details',
                    leading: Icons.arrow_back,
                    trailing: Icons.error),
                const SizedBox(height: 35),
                value.fileimage == null
                    ? const CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            AssetImage('Assets/images/avater2.png'),
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(
                          File(value.fileimage!.path),
                        ),
                      ),
                ElevatedButton.icon(
                    onPressed: () {
                      studentprovider.getimg();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Profile')),
                Textformwidget(ctrl: value.nameController, hinttext: 'Name'),
                Textformwidget(ctrl: value.ageController, hinttext: 'Age'),
                Textformwidget(ctrl: value.classController, hinttext: 'Class'),
                Textformwidget(
                    ctrl: value.rollNoController, hinttext: 'RollNumber'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (value.formkey.currentState!.validate()) {
                          onAddStudents(
                              context,
                              value.nameController,
                              value.ageController,
                              value.classController,
                              value.rollNoController);
                          Navigator.of(context).pop();
                          value.nameController.clear();
                          value.ageController.clear();
                          value.classController.clear();
                          value.rollNoController.clear();
                          value.fileimage = null;
                          FocusScope.of(context).unfocus();
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add '),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Future<void> onAddStudents(
      context,
      TextEditingController namectrl,
      TextEditingController agectrl,
      TextEditingController classctrl,
      TextEditingController rollnumctrl) async {
    final name = namectrl.text.trim();
    final age = agectrl.text.trim();
    final rollNo = rollnumctrl.text.trim();
    final class_ = classctrl.text.trim();

    if (name.isEmpty ||
        age.isEmpty ||
        rollNo.isEmpty ||
        class_.isEmpty ||
        Provider.of<StudentProvider>(context, listen: false)
            .fileimage!
            .path
            .isEmpty) {
      return;
    } else {
      snackBarWidget(
          ctx: context, title: 'New Student Added', clr: Colors.green);
    }
    final student = StudentModel(
      name: name,
      age: age,
      class_: class_,
      rollnumber: rollNo,
      photo:
          Provider.of<StudentProvider>(context, listen: false).fileimage!.path,
      id: DateTime.now().microsecondsSinceEpoch.toString(),
    );

    Provider.of<StudentProvider>(context, listen: false).addStudent(student);
    Provider.of<StudentProvider>(context, listen: false).getAllStudents();
  }
}
