import 'package:flutter/material.dart';
import 'package:flutter_application_9/add_screen/addingscreen/addingscreen.dart';
import 'package:flutter_application_9/add_screen/bottomnav/bottomnav.dart';
import 'package:flutter_application_9/controller/add_controller.dart';
import 'package:flutter_application_9/db/dbfun/dbfun.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';
import 'package:flutter_application_9/add_screen/editingscreen/editscreen.dart';

import 'package:flutter_application_9/add_screen/imageandname/imageandname.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ListOfAdded extends StatelessWidget {
  const ListOfAdded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.offAll(() => BottomNave());
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text('Student List'),
          backgroundColor: Colors.purple.shade800,
        ),
        body: SafeArea(
          child: GetBuilder<AddController>(
              init: AddController(),
              builder: (AddController addController) {
                return Container(
                  margin: EdgeInsets.all(20),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final data1 = addController.studentdata[index];
                        final image1 = images[index];
                        return ListTile(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             ImageAndname(data1, index, image1)));

                            Get.to(() => ImageAndname(data1, index, image1));
                          },
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => AddingScrean(
                                    //             true, data1, index)));

                                    Get.to(
                                        () => AddingScrean(true, data1, index));
                                  },
                                  icon: Icon(Icons.edit),
                                  color: Color.fromARGB(255, 2, 37, 66)),
                              IconButton(
                                  onPressed: () async {
                                    Get.defaultDialog(
                                        title: "Delete",
                                        textConfirm: "delete",
                                        textCancel: "cancel",
                                        onConfirm: () async {
                                          addController.deleteStudent(index);
                                          Get.back();
                                        },
                                        onCancel: () {
                                          Get.back();
                                        },
                                        backgroundColor:
                                            Color.fromARGB(255, 72, 18, 105),
                                        titleStyle:
                                            TextStyle(color: Colors.white),
                                        middleTextStyle:
                                            TextStyle(color: Colors.white),
                                        radius: 30);

                                    // Dialogbox1(index);
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Color.fromARGB(255, 2, 37, 66)),
                            ],
                          ),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(images[index])),
                          title: Text(data1.name),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 10,
                          color: Colors.white,
                        );
                      },
                      itemCount: addController.studentdata.length),
                );
              }),
        ));
  }

  // Future<void> Dialogbox1(index, BuildContext context) async {
  //   showDialog(
  //       context: context,
  //       builder: (ctx1) {
  //         return GetBuilder<AddController>(
  //             init: AddController(),
  //             builder: (AddController addController) {
  //               return AlertDialog(
  //                 title: Text('DELETE'),
  //                 actions: [
  //                   TextButton(
  //                       onPressed: () {
  //                         Navigator.of(ctx1).pop();
  //                       },
  //                       child: Text('close')),
  //                   TextButton(
  //                       onPressed: () async {
  //                         final box =
  //                             await Hive.box<Student>('studentcolection');

  //                         if (index >= 0) {
  //                           await box.deleteAt(index);
  //                         }
  //                         setState(() {
  //                           addController.studentdata.removeAt(index);
  //                         });

  //                         Navigator.of(ctx1).pop();
  //                       },
  //                       child: Text('delete'))
  //                 ],
  //               );
  //             });
  //       });
  // }
}
