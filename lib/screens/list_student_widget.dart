import 'package:data_base_hive/db/functions/db_functions.dart';
import 'package:data_base_hive/db/model/data_model.dart';
import 'package:data_base_hive/providers/updateStudent_provider.dart';
import 'package:data_base_hive/screens/add_student_form.dart';
import 'package:data_base_hive/screens/add_student_widget.dart';

import 'package:data_base_hive/screens/student_details.dart';
import 'package:data_base_hive/screens/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListStudentWIdget extends StatelessWidget {
  final List<StudentModel> showStudentList;
  const ListStudentWIdget({Key? key, required this.showStudentList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white60,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddStudentWidget(),
              ),
            );
          }),
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          if (studentList.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          return ListView.separated(
              itemBuilder: (ctx, index) {
                StudentModel data = showStudentList[index];

                return ListTile(
                  title: Text(data.name),
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage('lib/medias/unknown_person_3.png'),
                  ),
                  onLongPress: () async {
                    Provider.of<UpdateStudentProvider>(context, listen: false)
                        .updateStudent(data: data);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UpdateScreen(index: index),
                      ),
                    );
                  },
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return StudentDetails(
                            showStudentList: data,
                          );
                        },
                      ),
                    );
                  },
                  trailing: IconButton(
                      onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Delete Student'),
                              content: const Text("Do you want to delete?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    deleteStudent(index);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          ),
                      icon: const Icon(Icons.close)),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider(
                  indent: 15,
                  endIndent: 15,
                );
              },
              itemCount: showStudentList.length);
        },
      ),
    );
  }
}
