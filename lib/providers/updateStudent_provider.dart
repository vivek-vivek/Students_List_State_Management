import 'dart:developer';

import 'package:data_base_hive/db/model/data_model.dart';
import 'package:flutter/cupertino.dart';

class UpdateStudentProvider with ChangeNotifier {
  int? id;
  // String name = '';
  // String age = '';
  // String domain = '';
  // String parent = '';
  // String number = '';
  // String address = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  TextEditingController parentController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> updateStudent({required StudentModel data}) async {
    // id = data.id;
    nameController.text = data.name;
    ageController.text = data.age;
    domainController.text = data.domain;
    parentController.text = data.parent;
    numberController.text = data.number;
    addressController.text = data.address;

    notifyListeners();
    log('updateStudent');
  }
}
