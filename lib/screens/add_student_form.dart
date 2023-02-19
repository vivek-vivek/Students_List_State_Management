import 'package:data_base_hive/screens/add_student_widget.dart';
import 'package:flutter/material.dart';

class AddStudentForm extends StatelessWidget {
  const AddStudentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student Details"),
      ),
      body: SafeArea(child: AddStudentWidget()),
    );
  }
}
