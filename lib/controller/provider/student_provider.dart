import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import '../../Presentation/DB/model/model_dart.dart';

class StudentProvider with ChangeNotifier {
  //add
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final classController = TextEditingController();
  final rollNoController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  //edit
  TextEditingController editname = TextEditingController();
  TextEditingController editage = TextEditingController();
  TextEditingController editclass = TextEditingController();
  TextEditingController editrollrum = TextEditingController();

  final editFormkey = GlobalKey<FormState>();

  List<StudentModel> studentList = [];

  //pick image

  File? fileimage;
  Future<void> getimg() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (photo == null) {
      return;
    } else {
      final photoTemp = File(photo.path);
      fileimage = photoTemp;
    }
    notifyListeners();
  }

  List<StudentModel> foundeduser = [];

  //getst
  Future<List<StudentModel>> getAllStudents() async {
    log('called get fuc');
    final studentsDB = await Hive.openBox<StudentModel>('students_db');
    studentList.clear();
    studentList.addAll(studentsDB.values);
    foundeduser = studentList;
    notifyListeners();
    return studentList;
  }

  //add st
  Future<void> addStudent(values) async {
    final studentsDB = await Hive.openBox<StudentModel>('students_db');
    await studentsDB.add(values);
    studentList.add(values);
    getAllStudents();
    notifyListeners();
  }

  //edit
  Future<void> editdetails(int index, StudentModel student) async {
    final studentDB = await Hive.openBox<StudentModel>('students_db');
    studentDB.putAt(index, student);
    getAllStudents();
    notifyListeners();
  }

  //delete
  Future<void> deletest(int index) async {
    final studentDB = await Hive.openBox<StudentModel>('students_db');
    studentDB.deleteAt(index);
    getAllStudents();
    notifyListeners();
  }

  //search
  Future<void> searchResu(String text) async {
    List<StudentModel> result = [];
    if (text.isEmpty) {
      result = studentList;
    } else {
      result = studentList
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    foundeduser = result;
    notifyListeners();
  }
}
