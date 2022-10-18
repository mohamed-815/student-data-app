import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_9/add_screen/addingscreen/addingscreen.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';

import 'package:flutter_application_9/add_screen/listofadded/listofadded.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';

class EditingScreen extends StatelessWidget {
  const EditingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Center(child: Text('HOME')),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () =>

                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => AddingScrean(false, null, -1),
                      // ))
                      Get.to(() => AddingScrean(false, null, -1)),
                  child: Container(
                      margin: EdgeInsets.all(30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colors.purple.shade100),
                      child: Center(
                          child: Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: 'Raleway',
                                  color: Colors.purple.shade700),
                              'Student Add'))),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () =>

                      //  Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => ListOfAdded()))
                      Get.to(() => ListOfAdded()),
                  child: Container(
                      margin: EdgeInsets.all(30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.purple.shade100,
                      ),
                      child: Center(
                          child: Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: "Font1",
                                  color: Colors.purple.shade700),
                              'Student Details'))),
                ),
              )
            ],
          ),
        ));
  }
}
