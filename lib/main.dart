import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/screen/home_screen/mainScreen.dart';
import 'package:flutter_application_1/controller/provider/student_provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'Presentation/DB/model/model_dart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
