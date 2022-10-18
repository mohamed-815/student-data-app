import 'package:flutter_application_9/add_screen/addingscreen/addingscreen.dart';
import 'package:flutter_application_9/add_screen/editingscreen/editscreen.dart';
import 'package:flutter_application_9/add_screen/search/search.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  int selectedIndex = 0;

  changeIndexnow(index) {
    selectedIndex = index;

    update();
  }
}
