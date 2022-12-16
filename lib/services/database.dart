import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymbuddy/models/gym.dart';
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

  saveMember(String? uid) {
    final prefs = GetStorage();
    prefs.write('memberuid', uid);
  }



  Future<MemberModel> getmember() async {
    try {
      final prefs = GetStorage();
      final String? gymuid = prefs.read('gymuid');
      final String? memberuid = prefs.read('memberuid');
      DocumentSnapshot _doc = await _firestore
          .collection("Gyms")
          .doc(gymuid)
          .collection("Members")
          .doc(memberuid)
          .get();

      return MemberModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      rethrow;
    }
  }

  Future<GymModel> getgym() async {
    try {
      final prefs = GetStorage();
      final String? gymuid = prefs.read('gymuid');
      final String? memeruid = prefs.read('uid');
      DocumentSnapshot _doc =
          await _firestore.collection("Gyms").doc(gymuid).get();

      return GymModel.fromDocumentSnapshot(_doc);
    } catch (e) {
      rethrow;
    }
  }
}
