
import 'package:get/get.dart';
import 'package:gymbuddy/models/gym.dart';


class GymController extends GetxController {
  final Rx<GymModel> _gymModel = GymModel().obs;

  GymModel get gym => _gymModel.value;

  set gym(GymModel value) => this._gymModel.value = value;

  void clear() {
    _gymModel.value = GymModel();
  }
}
