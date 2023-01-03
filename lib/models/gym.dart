import 'package:cloud_firestore/cloud_firestore.dart';

class GymModel {
  String? gymName;
  String? gymID;
  double? gymHumidity;
  double? gymDegree;
  int? gymCapacity;
  String? gymUrl;
  int? gymInside;
  String? gymInstagram;

  GymModel(
      {this.gymName,
      this.gymID,
      this.gymHumidity,
      this.gymDegree,
      this.gymCapacity,
      this.gymUrl,
      this.gymInside,
      this.gymInstagram});

  factory GymModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    return GymModel(
        gymID: documentSnapshot['gymID'],
        gymName: documentSnapshot["gymName"],
        gymHumidity: documentSnapshot["gymHumidity"],
        gymDegree: documentSnapshot["gymDegree"],
        gymCapacity: documentSnapshot["gymCapacity"],
        gymUrl: documentSnapshot["gymUrl"],
        gymInside: documentSnapshot["gymInside"],
        gymInstagram: documentSnapshot["gymInstagram"]);
  }
}
