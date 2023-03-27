import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/screen/home_screen/mainScreen.dart';
import 'package:flutter_application_1/controller/core/colors.dart';
import 'package:hive_flutter/adapters.dart';

import 'Presentation/DB/model/model_dart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize hive
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.indigo,
      ),
      home:const  MainScreen(),
    );
  }
}
