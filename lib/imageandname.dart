// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';
import 'package:flutter_application_9/homepage.dart';

class ImageAndname extends StatefulWidget {
  bool isedited = false;
  Student? studforedit = null;
  int position = -1;
  String? images = null;

  ImageAndname(this.isedited, this.studforedit, this.position, this.images);

  @override
  State<ImageAndname> createState() => _ImageAndnameState();
}

class _ImageAndnameState extends State<ImageAndname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  backgroundImage: AssetImage(widget.images!),
                  radius: 90,
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(widget.studforedit!.name,
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
                  Text(widget.studforedit!.age,
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
                  Text(widget.studforedit!.school,
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
                  Text(widget.studforedit!.subject,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
