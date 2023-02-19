import 'package:data_base_hive/db/functions/db_functions.dart';
import 'package:data_base_hive/screens/add_student_form.dart';
import 'package:data_base_hive/screens/list_student_widget.dart';
import 'package:data_base_hive/screens/search_student.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const SearchStudent();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListStudentWIdget(showStudentList: studentListNotifier.value),
    );
  }
}
