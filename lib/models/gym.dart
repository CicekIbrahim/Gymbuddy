import 'package:cloud_firestore/cloud_firestore.dart';

class GymModel {
  String? gymName;
  String? gymID;
  double? gymHumidity;
  double? gymDegree;
  int? gymCapacity;
  String? gymUrl;

  GymModel(
      {this.gymName,
      this.gymID,
      this.gymHumidity,
      this.gymDegree,
      this.gymCapacity,
      this.gymUrl});

  factory GymModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    return GymModel(
        gymID: documentSnapshot['gymID'],
        gymName: documentSnapshot["gymName"],
        gymHumidity: documentSnapshot["gymHumidity"],
        gymDegree: documentSnapshot["gymDegree"],
        gymCapacity: documentSnapshot["gymCapacity"],
        gymUrl: documentSnapshot["gymUrl"]);
  }
}
