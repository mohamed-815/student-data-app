import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_9/add_screen/addingscreen/addingscreen.dart';
import 'package:flutter_application_9/add_screen/search/searchcontroller.dart';
import 'package:flutter_application_9/db/dbfun/dbfun.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';

import 'package:flutter_application_9/add_screen/imageandname/imageandname.dart';
import 'package:flutter_application_9/main.dart';
import 'package:get/get.dart';

SearchController searchController = Get.put(SearchController());

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: GetBuilder<SearchController>(
              init: SearchController(),
              builder: (SearchController searchController) {
                return Column(
                  //  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (value) {
                          searchController.searchStudent(value);
                        },
                        //    ...,other fields
                        controller: searchController.searchcontroller1,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          label: Text('search'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.purple.shade400),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.purple.shade800),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.all(20),
                          child: searchController
                                  .searchcontroller1.text.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) {
                                    final data1 =
                                        searchController.searchedstudent[index];
                                    final image1 = images[index];
                                    return ListTile(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //
                                        //
                                        // builder: (context) =>
                                        //             ImageAndname(
                                        //                 data1, index, image1)));

                                        Get.to(() =>
                                            ImageAndname(data1, index, image1));
                                      },
                                      // trailing: Row(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   children: [
                                      //     IconButton(
                                      //         onPressed: () {
                                      //           Navigator.push(
                                      //               context,
                                      //               MaterialPageRoute(
                                      //                   builder: (context) =>
                                      //                       AddingScrean(
                                      //                           true, data1, index)));
                                      //         },
                                      //         icon: Icon(Icons.edit),
                                      //         color: Color.fromARGB(255, 2, 37, 66)),
                                      //     IconButton(
                                      //         onPressed: () async {
                                      //           final box = await Hive.box<Student>(
                                      //               'studentcolection');

                                      //           if (index >= 0) {
                                      //             await box.deleteAt(index);
                                      //           }
                                      //           setState(() {
                                      //             searchedstudent.removeAt(index);
                                      //           });
                                      //         },
                                      //         icon: Icon(Icons.delete),
                                      //         color: Color.fromARGB(255, 2, 37, 66)),
                                      //   ],
                                      // ),
                                      leading: CircleAvatar(
                                          backgroundImage:
                                              AssetImage(images[index])),
                                      title: Text(data1.name),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      thickness: 10,
                                      color: Colors.white,
                                    );
                                  },
                                  itemCount:
                                      searchController.searchedstudent.length)
                              : Text(
                                  'Please search enything',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900),
                                )),
                    ),
                  ],
                );
              })),
    );
  }
}
