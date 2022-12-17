import 'package:get/get.dart';

import '../../controllers/authController.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
  
}