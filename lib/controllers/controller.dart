import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  late CollectionReference gymsRef = _firestore.collection('Gyms');

  late var fitStop = gymsRef.doc(getGymUid().toString());

  var inside = 15.obs;
  var degree = 22.obs;
  var humid = 66.obs;
  var totalp = 70.obs;
  var days = 150.obs;
  var userName = "Ibrahim".obs;
  var userID = " 2LUZWmcc2mTbBfplddqX".obs;
  var ppUrl =
      'https://image.shutterstock.com/image-vector/veni-vidi-vici-latin-quote-260nw-1787316482.jpg'
          .obs;
  var maleurl =
      'https://images.emojiterra.com/twitter/v13.1/512px/2642.png'.obs;
  var femaleurl = 'https://www.emojiall.com/en/header-svg/%E2%99%80.png'.obs;
  increment() {
    inside++;
  }
}

Future<String> getGymUid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? gymuid = prefs.getString('gymuid');
  return gymuid.toString();
}
Future<String> getMemberUid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? uid = prefs.getString('uid');
  return uid.toString();
}
