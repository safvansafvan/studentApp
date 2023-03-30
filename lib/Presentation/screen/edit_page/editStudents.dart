// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/DB/model/model_dart.dart';
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
          child: Consumer<StudentProvider>(builder: (context, value, child) {
            value.editname = TextEditingController(text: name);
            value.editage = TextEditingController(text: age);
            value.editclass = TextEditingController(text: class_);
            value.editrollrum = TextEditingController(text: rollno);
            return Form(
              key: value.editFormkey,
              child: Column(
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
                      File(value.fileimage?.path ?? photo),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        value.getimg();
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Image')),
                  SizedBox(
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: value.editname,
                            decoration: const InputDecoration(
                              hintText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: value.editage,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Age',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            maxLength: 3,
                            controller: value.editclass,
                            decoration: const InputDecoration(
                              hintText: 'class',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            controller: value.editrollrum,
                            decoration: const InputDecoration(
                              hintText: 'roll no',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton.icon(
                              style: const ButtonStyle(),
                              onPressed: () {
                                onEditSave(
                                    index: index,
                                    photo: value.fileimage!.path,
                                    ctx: context,
                                    name: value.editname,
                                    age: value.editage,
                                    eclass: value.editclass,
                                    roll: value.editrollrum);

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
            );
          }),
        ),
      ),
    );
  }

  onEditSave(
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
      rollnumber: eclass.text,
      class_: class_,
      photo: photo,
    );
    snackBarWidget(ctx: ctx, title: 'Edit Success', clr: Colors.green);

    Provider.of<StudentProvider>(ctx, listen: false)
        .editdetails(index, studentmodel);
    photo == null;
  }
}
