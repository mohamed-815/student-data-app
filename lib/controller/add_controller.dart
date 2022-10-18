import 'package:flutter/material.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class AddController extends GetxController {
  // @override
  // void onInit() async {
  //   super.onInit();
  //   await getingStudentlist();
  // }

  List<Student> studentdata = [];
  Future<void> getingStudentlist() async {
    final box = await Hive.openBox<Student>('studentcolection');
    studentdata = box.values.toList();
  }

  final namecontroller = TextEditingController();

  final agecontroller = TextEditingController();

  final schoolcontroller = TextEditingController();

  final subjectcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Future<void> addingTobox(isedited, index) async {
    final _namecontroller1 = namecontroller.text.trim();
    final _agecontroller1 = agecontroller.text.trim();
    final _schoolController1 = schoolcontroller.text.trim();
    final _subjectController1 = subjectcontroller.text.trim();
    if (_agecontroller1.isNotEmpty ||
        _agecontroller1.isNotEmpty ||
        _schoolController1.isNotEmpty ||
        _subjectController1.isNotEmpty) {
      final data = Student(
          name: _namecontroller1,
          age: _agecontroller1,
          school: _schoolController1,
          subject: _subjectController1);

      final box = await Hive.openBox<Student>('studentcolection');
      if (isedited == true) {
        await box.putAt(index, data);
      } else {
        await box.add(data);
      }
      studentdata = box.values.toList();
    }

    //   final Box = await Hive.openBox<Student>('studentcolection');
    //   setState(() {
    //
    //   });

    update();
  }

  deleteStudent(index) async {
    final box = await Hive.box<Student>('studentcolection');

    if (index >= 0) {
      await box.deleteAt(index);
    }

    studentdata = box.values.toList();
    update();
  }

  editedScreen(isedited, index) {
    if (isedited) {
      namecontroller.text = studentdata[index].name;
      agecontroller.text = studentdata[index].age;
      schoolcontroller.text = studentdata[index].school;
      subjectcontroller.text = studentdata[index].subject;
    }
  }

  controllerClear() {
    namecontroller.clear();
    agecontroller.clear();
    schoolcontroller.clear();
    subjectcontroller.clear();
  }
}
