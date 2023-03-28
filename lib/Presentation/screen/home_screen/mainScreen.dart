// ignore_for_file: file_names



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/DB/functions/db_functions.dart';
import 'package:flutter_application_1/Presentation/screen/Add_screen/addStudent.dart';
import 'package:flutter_application_1/Presentation/screen/home_screen/widget/students_list_view.dart';
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
            const AppBarWidget(
                titles: 'Students List',
                leading: Icons.home_filled,
                trailing: Icons.error),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CupertinoSearchTextField(
                  padding: const EdgeInsets.all(12),
                  style: textStyleFuc(
                      size: 15, clr: Colors.grey, bld: FontWeight.w500)),
            ),
           const StudentListView()
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
}
