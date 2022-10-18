import 'package:flutter/material.dart';
import 'package:flutter_application_9/add_screen/bottomnav/bottomnav.dart';
import 'package:flutter_application_9/controller/add_controller.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';
import 'package:flutter_application_9/add_screen/listofadded/listofadded.dart';
import 'package:flutter_application_9/main.dart';
import 'package:flutter_application_9/main.dart';
import 'package:flutter_application_9/main.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class AddingScrean extends StatelessWidget {
  bool isedited = false;
  Student? studforedit = null;
  int index = -1;

  AddingScrean(this.isedited, this.studforedit, this.index);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addController.editedScreen(isedited, index);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade600,
        title: Text('Register'),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 207, 164, 215),
            border: Border.all(
              color: Color.fromARGB(255, 179, 12, 208),
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(20))),
        child: GetBuilder<AddController>(
            init: AddController(),
            builder: (AddController addController) {
              // if (isedited) {
              //   addController.namecontroller.text =
              //       addController.studentdata[index].name;
              //   addController.agecontroller.text =
              //       addController.studentdata[index].age;
              //   addController.schoolcontroller.text =
              //       addController.studentdata[index].school;
              //   addController.subjectcontroller.text =
              //       addController.studentdata[index].subject;

              // }
              return Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: addController.formkey,
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                            controller: addController.namecontroller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.purple.shade800),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                            ),
                            validator: (valeu) {
                              if (valeu == null || valeu.isEmpty) {
                                return 'test is empty';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: addController.agecontroller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.purple.shade800),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.purple.shade400),
                              ),
                              labelText: 'Age',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Empty or invalid';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                            controller: addController.schoolcontroller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.purple.shade800),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'School',
                            ),
                            validator: (valeu) {
                              if (valeu == null || valeu.isEmpty) {
                                return 'test is empty';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                            controller: addController.subjectcontroller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.purple.shade800),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Subject',
                            ),
                            validator: (valeu) {
                              if (valeu == null || valeu.isEmpty) {
                                return 'test is empty';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 90,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 96, 57, 109),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              child: const Text('save'),
                              onPressed: () async {
                                if (addController.formkey.currentState!
                                    .validate()) {
                                  await addController.addingTobox(
                                      isedited, index);
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             ListOfAdded()));

                                  Get.to(() => ListOfAdded());
                                }
                                addController.controllerClear();
                              },
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              );
            }),
      )),
    );
  }
}
