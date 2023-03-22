import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyStreamController extends GetxController {
  final isLoading = true.obs;

  final gymStream = gymStreamFunction().asBroadcastStream();
  final memberStream = memberStreamFunction().asBroadcastStream();

  static Stream<DocumentSnapshot> gymStreamFunction() {
    final _firestore = FirebaseFirestore.instance;
    final prefs = GetStorage();

    return _firestore
        .collection('Gyms')
        .doc(prefs.read('gymuid').toString())
        .snapshots();
  }

  static Stream<DocumentSnapshot> memberStreamFunction() {
    final _firestore = FirebaseFirestore.instance;
    final prefs = GetStorage();
    return _firestore
        .collection('Gyms')
        .doc(prefs.read('gymuid').toString())
        .collection('Members')
        .doc(prefs.read('memberuid').toString())
        .snapshots();
  }

  @override
  void onReady() {
    gymStream.listen((data) {
      isLoading.value = false;
    });
    memberStream.listen((data) {
      isLoading.value = false;
    });
    super.onReady();
  }
}
