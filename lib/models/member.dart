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

  factory MemberModel.fromQueryDocumentSnapshot(
      {required QueryDocumentSnapshot querydocumentSnapshot}) {
    return MemberModel(
      memberID: querydocumentSnapshot['memberID'],
      memberName: querydocumentSnapshot['memberName'],
      memberSurname: querydocumentSnapshot['memberSurname'],
      memberActive: querydocumentSnapshot['memberActive'],
      memberDays: querydocumentSnapshot['memberDays'],
      memberGender: querydocumentSnapshot['memberGender'],
      memberEmail: querydocumentSnapshot['memberEmail'],
      memberUrl: querydocumentSnapshot['memberUrl'],
    );
  }

  factory MemberModel.fromMap(Map<String, dynamic> jsonMap) {
    return MemberModel(
      memberID: jsonMap['memberID'],
      memberName: jsonMap['memberName'],
      memberSurname: jsonMap['memberSurname'],
      memberDays: jsonMap['memberDays'],
      memberEmail: jsonMap['memberEmail'],
      memberGender: jsonMap['memberGender'],
      memberUrl: jsonMap['memberUrl'],
      memberActive: jsonMap['memberActive'],
    );
  }
}
