import 'package:data_base_hive/db/functions/db_functions.dart';
import 'package:data_base_hive/db/model/data_model.dart';

import 'package:flutter/material.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({super.key, required this.showStudentList});

  StudentModel showStudentList;
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: Text(showStudentList.name),
      ),
      body: SafeArea(
        child: Center(
          child: Card(
            child: SizedBox(
              width: 300,
              height: 500,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                children: [
                  Image.asset(
                    'lib/medias/unknown_person_3.png',
                    scale: 3,
                  ),
                  Text(
                    'Student Name : ${showStudentList.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Student Age : ${showStudentList.age}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Domain : ${showStudentList.domain}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Parent Name : ${showStudentList.parent}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Contact Number : ${showStudentList.number}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Address : ${showStudentList.address}',
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
