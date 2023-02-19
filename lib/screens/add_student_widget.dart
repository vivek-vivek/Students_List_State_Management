import 'dart:developer';

import 'package:data_base_hive/db/functions/db_functions.dart';
import 'package:data_base_hive/db/model/data_model.dart';
import 'package:data_base_hive/providers/addStudent_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    log('main builder');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student Details'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller:
                    Provider.of<AddStudentProvider>(context).nameController,
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
                    Provider.of<AddStudentProvider>(context).ageController,
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
                controller:
                    Provider.of<AddStudentProvider>(context).domainController,
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
                controller: Provider.of<AddStudentProvider>(context)
                    .parentNameController,
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
                controller:
                    Provider.of<AddStudentProvider>(context).numberController,
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
                controller:
                    Provider.of<AddStudentProvider>(context).addressController,
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
                    Provider.of<AddStudentProvider>(context, listen: false)
                        .onAddStudentButtonClicked();
                    if (_formKey.currentState!.validate()) {
                      Provider.of<AddStudentProvider>(context, listen: false)
                          .clearText();

                      Provider.of<AddStudentProvider>(context, listen: false)
                          .formSubmitted(context: context);
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Student'))
            ],
          ),
        ),
      ),
    );
  }
}
