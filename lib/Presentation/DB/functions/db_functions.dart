import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/model_dart.dart';

// create list of a student model

ValueNotifier<List<StudentModel>> studentList = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentsDB = await Hive.openBox<StudentModel>('students_db');
  final id = await studentsDB.add(value);
  value.id = id;
  studentList.value.add(value);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentList.notifyListeners();
  getAllStudents();
}

Future<void> getAllStudents() async {
  final studentsDB = await Hive.openBox<StudentModel>('students_db');
  studentList.value.clear();
  studentList.value.addAll(studentsDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentList.notifyListeners();
}

Future<void> deleteList(int index) async {
  final studentsDB = await Hive.openBox<StudentModel>('students_db');
  await studentsDB.deleteAt(index);
  getAllStudents();
}

Future<void> editList(int index, StudentModel student) async {
  final studentDb = await Hive.openBox<StudentModel>('students_db');
  studentDb.putAt(index, student);
  getAllStudents();
}
