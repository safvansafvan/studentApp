// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/DB/model/model_dart.dart';
import 'package:flutter_application_1/Presentation/widgets/textformfield.dart';
import 'package:flutter_application_1/Presentation/widgets/appbar.dart';
import 'package:flutter_application_1/Presentation/widgets/snack_bar.dart';
import 'package:flutter_application_1/controller/provider/student_provider.dart';
import 'package:provider/provider.dart';

class EditStudent extends StatelessWidget {
  final String name;
  final String class_;
  final String age;
  final String rollno;
  final int index;
  final String photo;

  const EditStudent(
      {super.key,
      required this.name,
      required this.class_,
      required this.age,
      required this.rollno,
      required this.index,
      required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<StudentProvider>(builder: (context, data, child) {
            data.editname = TextEditingController(text: name);
            data.editage = TextEditingController(text: age);
            data.editclass = TextEditingController(text: class_);
            data.editrollrum = TextEditingController(text: rollno);
            return Column(
              children: [
                const AppBarWidget(
                    titles: 'Edit Details',
                    leading: Icons.arrow_back,
                    trailing: Icons.error),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(
                    File(data.fileimage?.path ?? photo),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      data.getimg();
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Image')),
                Form(
                  key: data.editFormkey,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Textformwidget(
                            ctrl: data.editname,
                            hinttext: "Name",
                            isNumber: false),
                        Textformwidget(
                            ctrl: data.editage,
                            hinttext: "Age",
                            isNumber: true),
                        Textformwidget(
                            ctrl: data.editclass,
                            hinttext: "Class",
                            isNumber: false),
                        Textformwidget(
                            ctrl: data.editrollrum,
                            hinttext: "Roll No",
                            isNumber: true),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (data.editFormkey.currentState!.validate()) {
                                onEditSave(
                                    index: index,
                                    photo: data.fileimage?.path ?? photo,
                                    ctx: context,
                                    name: data.editname,
                                    age: data.editage,
                                    eclass: data.editclass,
                                    roll: data.editrollrum);
                                Navigator.of(context).pop();
                                FocusScope.of(context).unfocus();
                              }
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
            );
          }),
        ),
      ),
    );
  }

  Future<void> onEditSave(
      {required ctx,
      required index,
      required photo,
      required TextEditingController name,
      required TextEditingController age,
      required TextEditingController eclass,
      required TextEditingController roll}) async {
    final studentmodel = StudentModel(
      name: name.text,
      age: age.text,
      rollnumber: roll.text,
      class_: eclass.text,
      photo: photo,
    );
    snackBarWidget(ctx: ctx, title: 'Edit Success', clr: Colors.green);

    Provider.of<StudentProvider>(ctx, listen: false)
        .editdetails(index, studentmodel);
  }
}
