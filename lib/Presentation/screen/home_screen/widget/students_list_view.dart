import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/screen/edit_page/editStudents.dart';
import 'package:flutter_application_1/Presentation/screen/student_information/fullList.dart';
import 'package:flutter_application_1/Presentation/widgets/snack_bar.dart';
import 'package:flutter_application_1/controller/core/colors.dart';
import 'package:flutter_application_1/controller/provider/student_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<StudentProvider>(
      builder: (context, value, child) {
        if (value.foundeduser.isEmpty) {
          return SizedBox(
            height: size.height * 0.8,
            child: Center(
                child: Text(
              'No Students Found',
              style: textStyleFuc(
                  size: 15, clr: Colors.black, bld: FontWeight.bold),
            )),
          );
        } else {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data = value.foundeduser[index];
                return Slidable(
                  endActionPane:
                      ActionPane(motion: const BehindMotion(), children: [
                    SlidableAction(
                      onPressed: (context) {
                        Navigator.push(context, MaterialPageRoute(
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
                        ));
                      },
                      icon: Icons.edit,
                      foregroundColor: Colors.blue,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        deleteButtonTap(context, value, index);
                      },
                      icon: Icons.delete,
                      foregroundColor: Colors.red,
                    ),
                  ]),
                  child: Padding(
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
                      trailing: IconButton(
                          tooltip: 'Drag left',
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios)),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: value.foundeduser.length);
        }
      },
    );
  }

  void deleteButtonTap(context, value, index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Alert!!',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        content: const Text('Are You Sure Delete This Student'),
        actions: [
          TextButton(
            onPressed: () {
              value.deletest(index);
              snackBarWidget(ctx: context, title: 'Deleted', clr: Colors.red);
              Navigator.pop(context);
              FocusScope.of(context).unfocus();
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
  }
}
