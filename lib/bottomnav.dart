// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/editscreen.dart';
import 'package:flutter_application_9/homepage.dart';
import 'package:flutter_application_9/listofadded.dart';
import 'package:flutter_application_9/search.dart';

class BottomNave extends StatefulWidget {
  const BottomNave({Key? key}) : super(key: key);

  @override
  State<BottomNave> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNave> {
  int _selectedIndex = 0;
  final _pages = [
    EditingScreen(),
    AddingScrean(false, null, -1),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          currentIndex: _selectedIndex,
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
          onTap: (indx) {
            setState(() {
              _selectedIndex = indx;
            });
          }),
    );
  }
}
