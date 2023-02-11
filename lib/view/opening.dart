import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymbuddy/controllers/controller.dart';

import '../controllers/landingPageController.dart';

class OpeningPage extends StatelessWidget {
  final controller = Get.put(Controller());

   OpeningPage({Key? key}) : super(key: key);

  _getuid(index, List<DocumentSnapshot> listofDocumentSnapshot) {
    final prefs = GetStorage();
    prefs.write('gymuid', listofDocumentSnapshot[index]['gymID'].toString());
  }

  final landingcontroller = Get.put(LandingPageController());

  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference gymsRef = _firestore.collection('Gyms');
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Hoş Geldiniz',
                style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    color: Colors.white60,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Salonunuzu Seçiniz',
                style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    color: Colors.white60,
                    fontWeight: FontWeight.bold),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: gymsRef.snapshots(),
                builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                  if (asyncSnapshot.data != null) {
                    List<DocumentSnapshot> listofDocumentSnapshot =
                        asyncSnapshot.data.docs;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _getuid(index, listofDocumentSnapshot);
                            Get.offAndToNamed('/login');
                          },
                          child: SizedBox(
                            width: Get.width / 1.5,
                            height: Get.height / 11,
                            child: Card(
                                clipBehavior: Clip.hardEdge,
                                color: Colors.grey[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: Image.network(
                                    listofDocumentSnapshot[index]['gymUrl']
                                        .toString())),
                          ),
                        );
                      },
                      itemCount: listofDocumentSnapshot.length,
                    );
                  } else {
                    return const Text('Bir Hata Oluştu');
                  }
                }),
            const Spacer(
              flex: 6,
            )
          ],
        ),
      ),
    );
  }
}
