import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel {
  String? memberID;
  String? memberName;
  String? memberSurname;
  bool? memberActive;
  int? memberDays;
  bool? memberGender;
  String? memberEmail;
  String? memberUrl;

  MemberModel(
      {this.memberID,
      this.memberName,
      this.memberSurname,
      this.memberActive,
      this.memberDays,
      this.memberGender,
      this.memberEmail,
      this.memberUrl});

  factory MemberModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    return MemberModel(
      memberID: documentSnapshot['memberID'],
      memberName: documentSnapshot['memberName'],
      memberSurname: documentSnapshot['memberSurname'],
      memberActive: documentSnapshot['memberActive'],
      memberDays: documentSnapshot['memberDays'],
      memberGender: documentSnapshot['memberGender'],
      memberEmail: documentSnapshot['memberEmail'],
      memberUrl: documentSnapshot['memberUrl'],
    );
  }
}
