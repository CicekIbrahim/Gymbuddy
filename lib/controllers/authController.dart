import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/controllers/memberController.dart';
import '../services/database.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?>? _firebaseUser;

  @override
  onInit() {
    super.onInit();
    _firebaseUser?.bindStream(_auth.authStateChanges());
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.put(MemberController());
      await Database().saveMember(_authResult.user?.uid);
      Get.find<MemberController>().member =
          await Database().getmember();
      Get.offAndToNamed('/landing');
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<MemberController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.hashCode.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
