import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  late CollectionReference gymsRef = _firestore.collection('Gyms');
  late var gym = gymsRef.doc(getGymUid().toString());
  late var member = gym.collection('Members').doc();
  var inside = 15.obs;
  var degree = 22.obs;
  var humid = 66.obs;
  var totalp = 70.obs;
  var days = 150.obs;
  //late var userName = "".obs;

  var maleurl =
      'https://images.emojiterra.com/twitter/v13.1/512px/2642.png'.obs;
  var femaleurl = 'https://www.emojiall.com/en/header-svg/%E2%99%80.png'.obs;
  increment() {
    inside++;
  }

  String getMemberUid() {
    final prefs = GetStorage();
    final String? memberuid = prefs.read('memberuid');
    return memberuid.toString();
  }

  String getGymUid() {
    final prefs = GetStorage();
    final String? gymuid = prefs.read('gymuid');
    return gymuid.toString();
  }
}
