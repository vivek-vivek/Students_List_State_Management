import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String parent;
  @HiveField(4)
  final String number;
  @HiveField(5)
  final String address;
  @HiveField(6)
  final String domain;
  StudentModel({
    required this.name,
    required this.age,
    this.id,
    required this.parent,
    required this.number,
    required this.address,
    required this.domain,
  });
}
