import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymbuddy/controllers/memberController.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/controller.dart';
import '../controllers/landingPageController.dart';
import '../services/database.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(Controller());
  final prefs = GetStorage();
  final landingcontroller = Get.put(LandingPageController());
  final _firestore = FirebaseFirestore.instance;

  ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: StreamBuilder<DocumentSnapshot>(
                  stream: _firestore
                      .collection('Gyms')
                      .doc(Controller().getGymUid())
                      .collection('Members')
                      .doc(Controller().getMemberUid())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data!['memberUrl'] != "") {
                      var member = snapshot.data!;
                      return SizedBox(
                        height: Get.height / 7,
                        width: Get.width / 3,
                        child:
                            ClipOval(child: Image.network(member['memberUrl'])),
                      );
                    } else {
                      return SizedBox(
                        height: Get.height / 12,
                        child: ClipOval(
                            child: Image.network(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png")),
                      );
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: GetX<MemberController>(
                init: MemberController(),
                initState: (_) async {
                  Get.find<MemberController>().member =
                      await Database().getmember();
                },
                builder: (_) {
                  return Text(
                    "${_.member.memberName} ${_.member.memberSurname}",
                    style: TextStyle(
                        fontSize: (Get.height * Get.width) / 7000,
                        color: Colors.white),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 25),
              child: Text(
                "ID: " + controller.getMemberUid(),
                style: TextStyle(
                    fontSize: (Get.height * Get.width) / 17000,
                    color: Colors.white60),
              ),
            ),
            SizedBox(
                height: Get.height / 15,
                width: Get.width / 2,
                child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    backgroundColor: Colors.amber,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => SizedBox(
                                child: AlertDialog(
                                  backgroundColor: Colors.grey[850],
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0))),
                                  title: const Text(
                                    'Profil Resmi Seç',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: const Text(
                                    'Yeni Profil Resminiz için Kaynak Seçiniz',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          controller
                                              .uploadImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                          AlertDialog(
                                            content: const Text(
                                              'Profil Resmi Başarıyla Değiştirildi',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Center(
                                                    child: Text('Kapat')),
                                              )
                                            ],
                                          );
                                        },
                                        child: const Text(
                                          'Galeri',
                                          style: TextStyle(color: Colors.amber),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          controller
                                              .uploadImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Kamera',
                                          style: TextStyle(color: Colors.amber),
                                        ))
                                  ],
                                ),
                              ));
                    },
                    label: const Text('Profili Resmini DÜzenle'))),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[850]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 16),
                      child: Text(
                        'Kalan Üyelik Süresi',
                        style: TextStyle(
                            fontSize: (Get.height * Get.width) / 10500,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: GetX<MemberController>(
                              init: MemberController(),
                              initState: (_) async {
                                Get.find<MemberController>().member =
                                    await Database().getmember();
                              },
                              builder: (_) {
                                return LinearProgressIndicator(
                                  value: ((_.member.memberDays?.toInt())!
                                              .toDouble() /
                                          365)
                                      .toDouble(),
                                  color: Colors.amber,
                                  backgroundColor: Colors.grey,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 0, 8),
                      child: GetX<MemberController>(
                        init: MemberController(),
                        initState: (_) async {
                          Get.find<MemberController>().member =
                              await Database().getmember();
                        },
                        builder: (_) {
                          return Text(
                            '${_.member.memberDays} Gün',
                            style: TextStyle(
                                fontSize: (Get.height * Get.width) / 15000,
                                color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.offAndToNamed('/opening');
                prefs.remove('memberuid');
                prefs.remove('gymuid');
                landingcontroller.tabIndex.value = 0;
              },
              child: Text("Çıkış Yap",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: (Get.height * Get.width) / 12000)),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
