// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_9/controller/add_controller.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';
import 'package:get/state_manager.dart';

class ImageAndname extends StatelessWidget {
  Student? studforedit = null;
  int index = -1;
  String? images = null;

  ImageAndname(this.studforedit, this.index, this.images);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
      ),
      body: SafeArea(
        child: GetBuilder<AddController>(
            init: AddController(),
            builder: (AddController addController) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                        child: Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(images!),
                        radius: 90,
                      ),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(studforedit!.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                            ))),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age : ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            )),
                        Text(studforedit!.age,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            )),
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('School : ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            )),
                        Text(studforedit!.school,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            )),
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Subject : ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            )),
                        Text(studforedit!.subject,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            )),
                      ],
                    )),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
