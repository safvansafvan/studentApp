// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/screen/student_information/fullList.dart';

import '../../DB/functions/db_functions.dart';

class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon:const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon:const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentList,
      builder: (context, studentlist, child) => ListView.builder(
        itemBuilder: (ctx, index) {
          final data = studentlist[index];
          if (data.name.contains(
            query.trim(),
          )) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) {
                          return FullDetails(
                            name: data.name,
                            age: data.age,
                            class_: data.class_,
                            rollno: data.rollnumber,
                          );
                        }),
                      ),
                    );
                  },
                  title: Text(data.name),
                  leading:const CircleAvatar(
                    backgroundImage: AssetImage('Assets/images/logo.jpg'),
                  ),
                ),
                const Divider()
              ],
            );
          } else {
            return const Text("error");
          }
        },
        itemCount: studentlist.length,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentList,
      builder: (context, studenylst, child) => ListView.builder(
        itemBuilder: (ctx, index) {
          final data = studenylst[index];

          if (data.name.contains(
            query.trim(),
          )) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) {
                          return FullDetails(
                            name: data.name,
                            age: data.age,
                            class_: data.class_,
                            rollno: data.rollnumber,
                          );
                        }),
                      ),
                    );
                  },
                  title: Text(data.name),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('Assets/images/logo.jpg'),
                  ),
                ),
                const Divider()
              ],
            );
          } else {
            return Container();
          }
        },
        itemCount: studenylst.length,
      ),
    );
  }
}
