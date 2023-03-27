// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FullDetails extends StatelessWidget {
  final String name;
  final String class_;

  final String age;

  final String rollno;

  const FullDetails({
    super.key,
    required this.name,
    required this.age,
    required this.class_,
    required this.rollno,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Details'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
              ),
              height: 250,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                     SizedBox(
                      height: 200,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 85,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'Assets/images/logo.jpg',
                          ),
                          radius: 80,
                        ),

                        //
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Text(
                          'NAME :  $name'.toUpperCase(),
                          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          'CLASS :  $class_',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          'AGE : $age',
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          'ROLL NO : $rollno',
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
