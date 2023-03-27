// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/DB/functions/db_functions.dart';
import 'package:flutter_application_1/Presentation/DB/model/model_dart.dart';
import 'package:flutter_application_1/Presentation/screen/Add_screen/addStudent.dart';
import 'package:flutter_application_1/Presentation/screen/edit_page/editStudents.dart';
import 'package:flutter_application_1/Presentation/screen/student_information/fullList.dart';
import 'package:flutter_application_1/Presentation/widgets/appbar.dart';
import 'package:flutter_application_1/controller/core/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          const  AppBarWidget(
                titles: 'Students List',
                leading: Icons.home_filled,
                trailing: Icons.error),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CupertinoSearchTextField(
                padding:const EdgeInsets.all(12),
                style: textStyleFuc(size:15 , clr: Colors.grey,bld: FontWeight.w500)
              ),
            ),
            ValueListenableBuilder(
              valueListenable: studentList,
              builder: (BuildContext context, List<StudentModel> value,
                  Widget? child) {
                return ListView.separated(
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
                                ),
                              ),
                            );
                          },
                          title: Text(data.name.toUpperCase(),
                              style: const TextStyle(fontSize: 15)),
                          leading: const CircleAvatar(
                            backgroundImage:
                                AssetImage('Assets/images/logo.jpg'),
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
                                        'alert!!',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      content: const Text(
                                          'do you really want to delete this student '),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            deleteList(index);
                                            popoutfunction(context);
                                          },
                                          child: const Text(
                                            'yes',
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            popoutfunction(context);
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddStudent(),
            ),
          );
        },
        label: const Text('Add New Student'),
      ),
    );
  }

  popoutfunction(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
