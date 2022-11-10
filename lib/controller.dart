import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/profile.dart';

import 'home.dart';

class Controller extends GetxController {
  var inside = 15.obs;
  var degree = 22.obs;
  var humid = 66.obs;
  var total = 70.obs;
  var userName = "Ibrahim".obs;
  var ppUrl =
      'https://image.shutterstock.com/image-vector/veni-vidi-vici-latin-quote-260nw-1787316482.jpg'
          .obs;



  increment() {
    inside++;
  }

  
}
