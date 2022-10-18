// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/add_screen/addingscreen/addingscreen.dart';
import 'package:flutter_application_9/add_screen/bottomnav/bottomcontroller.dart';
import 'package:flutter_application_9/add_screen/editingscreen/editscreen.dart';
import 'package:flutter_application_9/add_screen/search/search.dart';
import 'package:get/get.dart';

BottomController bottomController = Get.put(BottomController());

class BottomNave extends StatelessWidget {
  BottomNave({super.key});
  final pages = [
    EditingScreen(),
    AddingScrean(false, null, -1),
    SearchPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomController>(
        init: BottomController(),
        builder: (BottomController bottomController) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: pages[bottomController.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.purple,
                currentIndex: bottomController.selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: 'Add',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'search',
                  ),
                ],
                onTap: (index) {
                  bottomController.changeIndexnow(index);
                }),
          );
        });
  }
}
