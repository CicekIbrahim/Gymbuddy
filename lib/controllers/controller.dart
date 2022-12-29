import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class Controller extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final cloudinary = Cloudinary.full(
      apiKey: "252663832325657",
      apiSecret: "5zZFB_VPbGXj3KJ7BvetOONKGdk",
      cloudName: "duhzykhah");
  late CollectionReference gymsRef = _firestore.collection('Gyms');
  late var gym = gymsRef.doc(getGymUid().toString());
  late var member = gym.collection('Members').doc(getMemberUid().toString());
  var inside = 15.obs;

  var totalp = 70.obs;

  File? image;
  String? imagePath;
  final _picker = ImagePicker();
  //late var userName = "".obs;

  var maleurl =
      'https://images.emojiterra.com/twitter/v13.1/512px/2642.png'.obs;
  var femaleurl = 'https://www.emojiall.com/en/header-svg/%E2%99%80.png'.obs;

  String getMemberUid() {
    final prefs = GetStorage();
    final String? memberuid = prefs.read('memberuid');
    return memberuid.toString();
  }

  String getGymUid() {
    final prefs = GetStorage();
    final String? gymuid = prefs.read('gymuid');
    return gymuid.toString();
  }

  uploadImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      final response = await cloudinary.uploadFile(
          filePath: imagePath,
          resourceType: CloudinaryResourceType.image,
          folder: "/Gymbuddy/Members");
      member.update({'memberUrl': response.url});
      return response;
    } else {
      return false;
    }
  }
}
