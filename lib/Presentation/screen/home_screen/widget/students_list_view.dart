import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/DB/functions/db_functions.dart';
import 'package:flutter_application_1/Presentation/DB/model/model_dart.dart';
import 'package:flutter_application_1/Presentation/screen/edit_page/editStudents.dart';
import 'package:flutter_application_1/Presentation/screen/student_information/fullList.dart';
import 'package:flutter_application_1/controller/core/colors.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentList,
      builder: (BuildContext context, List<StudentModel> value, Widget? child) {
        return value.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Center(
                    child: Text(
                  'No Students Found',
                  style: textStyleFuc(
                      size: 15, clr: Colors.black, bld: FontWeight.bold),
                )),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = value[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullDetails(
                              name: data.name,
                              age: data.age,
                              class_: data.class_,
                              rollno: data.rollnumber,
                              photo: data.photo,
                            ),
                          ),
                        );
                      },
                      title: Text(data.name.toUpperCase(),
                          style: const TextStyle(fontSize: 15)),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(File(data.photo)),
                        radius: 30,
                      ),
                      trailing: Wrap(
                        spacing: 14,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EditStudent(
                                      name: data.name,
                                      class_: data.class_,
                                      age: data.age,
                                      rollno: data.rollnumber,
                                      index: index,
                                      photo: data.photo,
                                    );
                                  },
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                            color: Colors.blue,
                          ),
                          IconButton(
                            onPressed: () {
                              // deleteList(index);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Alert!!',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  content: const Text(
                                      'Are You Sure Delete This Student'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        deleteList(index);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Yes',
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: value.length);
      },
    );
  }
}
