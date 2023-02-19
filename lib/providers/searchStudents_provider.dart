import 'package:data_base_hive/db/functions/db_functions.dart';
import 'package:data_base_hive/db/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchStudentProvider with ChangeNotifier {
  List<StudentModel> foundStudents = studentListNotifier.value;
  List<StudentModel> results = [];

  runFilter(String enteredKeyword) {
    // foundStudents.clear();
    // results.clear();
    if (enteredKeyword.isEmpty) {
      results = studentListNotifier.value;
    } else {
      results = studentListNotifier.value
          .where((element) =>
              element.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    foundStudents = results;
    notifyListeners();
  }

  void initState() {
    foundStudents;
    // notifyListeners();
  }
}
