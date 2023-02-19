import 'package:data_base_hive/db/functions/db_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/model/data_model.dart';

class AddStudentProvider with ChangeNotifier {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final domainController = TextEditingController();
  final parentNameController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  final submitMessage = 'Form Submitted Successfully';

  Future<void> onAddStudentButtonClicked() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final parent = parentNameController.text.trim();
    final number = numberController.text.trim();
    final address = addressController.text.trim();
    final domain = domainController.text.trim();
    if (name.isEmpty ||
        age.isEmpty ||
        parent.isEmpty ||
        address.isEmpty ||
        domain.isEmpty) {
      return;
    }

    final student = StudentModel(
      name: name,
      age: age,
      parent: parent,
      number: number,
      address: address,
      domain: domain,
      id: DateTime.now().microsecondsSinceEpoch,
    );
    await addStudent(student);
    notifyListeners();
  }

  void clearText() {
    nameController.clear();
    ageController.clear();
    parentNameController.clear();
    numberController.clear();
    addressController.clear();
    domainController.clear();
    notifyListeners();
  }

  void formSubmitted({required context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(10),
        content: Text(submitMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
