import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/member.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewmember(MemberModel member) async {
    try {
      await _firestore.collection("Members").doc().set({
        "MemberName": member.memberName,
        "MemberSurname": member.memberSurname,
        "MemberEmail": member.memberEmail,
        "MemberGender": member.memberGender,
        "MemberDays": member.memberDays,
        "MemberActive": member.memberActive,
        "MemberUrl": member.memberUrl,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<MemberModel> getmember(String? uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("Gyms").doc('g3yO7gOYDZ1FQvaCDUW1').collection("Members").doc(uid).get();

      return MemberModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }


}
