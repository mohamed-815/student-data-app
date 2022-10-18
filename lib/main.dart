import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/add_screen/bottomnav/bottomnav.dart';
import 'package:flutter_application_9/controller/add_controller.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvide;

AddController addController = Get.put(AddController());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvide.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StudentAdapter());
  // final box = await Hive.openBox<Student>('studentcolection');
  // final studentdata = box.values.toList();
  await addController.getingStudentlist();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: BottomNave());
  }
}
