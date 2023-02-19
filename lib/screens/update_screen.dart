import 'dart:developer';

import 'package:data_base_hive/db/functions/db_functions.dart';
import 'package:data_base_hive/db/model/data_model.dart';
import 'package:data_base_hive/providers/updateStudent_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  UpdateScreen({super.key, required this.index});

  /// passed [index] here for add data into the same [index]
  final int index;
  updateData({required context}) async {
    final pro = Provider.of<UpdateStudentProvider>(context, listen: false);
    log('updateData');
    if (formKey.currentState!.validate()) {
      // Provider.of<UpdateStudentProvider>(context).updateStudentData();

      final studentDB = await Hive.openBox<StudentModel>('student_db');
      studentDB.putAt(
        /// [Id] is alwasy [null] thats why i use [index] for [updating] data
        pro.id ?? index,
        StudentModel(
            name: pro.nameController.text,
            age: pro.ageController.text,
            parent: pro.parentController.text,
            number: pro.numberController.text,
            address: pro.addressController.text,
            domain: pro.domainController.text),
      );
      getAllStudents();
      Navigator.pop(context);
      log('Student Data update with user id : ${pro.id} index : $index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Student Data"),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: Provider.of<UpdateStudentProvider>(context)
                      .nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Student Name',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter student name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller:
                      Provider.of<UpdateStudentProvider>(context).ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Student Age',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter student age';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: Provider.of<UpdateStudentProvider>(context)
                      .domainController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Domain',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter student domain';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: Provider.of<UpdateStudentProvider>(context)
                      .parentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Parent Name',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter parent name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: Provider.of<UpdateStudentProvider>(context)
                      .numberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Contact Number',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contact number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
                  textCapitalization: TextCapitalization.words,
                  controller: Provider.of<UpdateStudentProvider>(context)
                      .addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Address',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter student address';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        log('form validation finished');
                        updateData(context: context);
                        formUpdated(context: context);
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Update Student'))
              ],
            ),
          )),
    );
  }

  void formUpdated({required context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        margin: EdgeInsets.all(10),
        content: Text('Student data updated'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
