
// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:gymbuddy/models/gym.dart';


class GymController extends GetxController {
  final Rx<GymModel> _gymModel = GymModel().obs;

  GymModel get gym => _gymModel.value;

  set gym(GymModel value) => _gymModel.value = value;

  void clear() {
    _gymModel.value = GymModel();
  }
}
