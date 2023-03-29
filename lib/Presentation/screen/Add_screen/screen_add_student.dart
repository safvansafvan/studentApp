import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/screen/Add_screen/widget/addstudent.dart';

class ScreenAddStudets extends StatelessWidget {
  const ScreenAddStudets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: AddStudent(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
