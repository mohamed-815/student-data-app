import 'package:hive/hive.dart';
part 'dbmodel.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  String name;

  @HiveField(1)
  String age;

  @HiveField(2)
  String school;

  @HiveField(3)
  String subject;

  Student(
      {required this.name,
      required this.age,
      required this.school,
      required this.subject});
}
