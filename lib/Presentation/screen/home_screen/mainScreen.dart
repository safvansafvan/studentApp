// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/screen/Add_screen/screen_add_student.dart';
import 'package:flutter_application_1/Presentation/screen/home_screen/widget/students_list_view.dart';
import 'package:flutter_application_1/Presentation/widgets/appbar.dart';
import 'package:flutter_application_1/controller/core/colors.dart';
import 'package:flutter_application_1/controller/provider/student_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context, listen: false).getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(
                titles: 'Students List',
                leading: Icons.home_filled,
                trailing: Icons.error),
            Consumer<StudentProvider>(builder: (context, values, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CupertinoSearchTextField(
                    onChanged: (value) => values.searchResu(value),
                    padding: const EdgeInsets.all(12),
                    style: textStyleFuc(
                        size: 15, clr: Colors.grey, bld: FontWeight.w500)),
              );
            }),
            const StudentListView()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScreenAddStudets()),
          );
        },
        label: const Text('Add New Student'),
      ),
    );
  }
}
