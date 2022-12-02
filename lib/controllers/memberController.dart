import 'package:get/get.dart';
import 'package:gymbuddy/models/member.dart';


class MemberController extends GetxController {
  final Rx<MemberModel> _memberModel = MemberModel().obs;

  MemberModel get member => _memberModel.value;

  set member(MemberModel value) => this._memberModel.value = value;

  void clear() {
    _memberModel.value = MemberModel();
  }
}
