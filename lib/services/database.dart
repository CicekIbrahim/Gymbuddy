import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/member.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<bool> createNewmember(MemberModel member) async {
    try {
      await _firestore.collection("Members").doc().set({
        "memberName": member.memberName,
        "memberSurname": member.memberSurname,
        "memberEmail": member.memberEmail,
        "memberGender": member.memberGender,
        "memberDays": member.memberDays,
        "memberActive": member.memberActive,
        "memberUrl": member.memberUrl,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<MemberModel> getmember(String? uid) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'uid', uid.toString());
      final String? gymuid = prefs.getString('gymuid');

      DocumentSnapshot _doc = await _firestore
          .collection("Gyms")
          .doc(gymuid)
          .collection("Members")
          .doc(uid)
          .get();

      return MemberModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {

      rethrow;
    }
  }
}
