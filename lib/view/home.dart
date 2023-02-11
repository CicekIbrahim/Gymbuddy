import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymbuddy/controllers/memberController.dart';
import 'package:gymbuddy/services/database.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/controller.dart';
import '../controllers/landingPageController.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(Controller());
  final _firestore = FirebaseFirestore.instance;
  final landingcontroller = Get.put(LandingPageController());
  String memberuid = Controller().getMemberUid().toString();
  final prefs = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF121212),
        extendBody: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 50, 85, 8),
                  child: GetX<MemberController>(
                    init: MemberController(),
                    initState: (_) async {
                      Get.find<MemberController>().member =
                          await Database().getmember();
                    },
                    builder: (_) {
                      return Text(
                        "Merhaba \n${_.member.memberName}",
                        style: TextStyle(
                            fontSize: (Get.height * Get.width) / 7000,
                            color: Colors.white),
                      );
                    },
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      landingcontroller.tabIndex.value = 1;
                    },
                    child: SizedBox(
                      height: Get.height / 12,
                      width: Get.width / 6,
                      child: ClipOval(
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: _firestore
                                  .collection('Gyms')
                                  .doc(prefs.read('gymuid').toString())
                                  .collection('Members')
                                  .doc(prefs.read('memberuid').toString())
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.data!['memberUrl'] != "") {
                                  var member = snapshot.data!;
                                  return SizedBox(
                                    height: Get.height / 12,
                                    child: ClipOval(
                                        child:
                                            Image.network(member['memberUrl'])),
                                  );
                                } else {
                                  return SizedBox(
                                    height: Get.height / 12,
                                    child: ClipOval(
                                        child: Image.network(
                                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png")),
                                  );
                                }
                              })),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 0, 8),
              child: Text(
                "Şu anda ",
                style: TextStyle(
                    fontSize: (Get.height * Get.width) / 9000,
                    color: Colors.white),
              ),
            ),
            StreamBuilder<DocumentSnapshot>(
                stream: _firestore
                    .collection('Gyms')
                    .doc(prefs.read('gymuid').toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  var gym = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[850]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 8),
                            child: Text(
                              'Doluluk Oranı',
                              style: TextStyle(
                                  fontSize: (Get.height * Get.width) / 10500,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 0, 5),
                              child: Text(
                                '%${((gym['gymInside'] * 100) / gym['gymCapacity']).toStringAsFixed(1)}',
                                style: TextStyle(
                                    fontSize: (Get.height * Get.width) / 15000,
                                    color: Colors.white),
                              )),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: LinearProgressIndicator(
                                    value:
                                        (gym['gymInside'] / gym['gymCapacity'])
                                            .toDouble(),
                                    color: Colors.amber,
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(12, 5, 0, 8),
                              child: Text(
                                '${gym['gymInside']} Kişi',
                                style: TextStyle(
                                    fontSize: (Get.height * Get.width) / 15000,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  );
                }),
            Expanded(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(22),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[850]),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.thermostat_rounded,
                                color: Colors.amber,
                                size: (Get.height * Get.width) / 8000,
                              ),
                              Text(
                                'Sıcaklık',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (Get.height * Get.width) / 13000,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: StreamBuilder<DocumentSnapshot>(
                                  stream: _firestore
                                      .collection('Gyms')
                                      .doc(prefs.read('gymuid').toString())
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        '${snapshot.data!['gymDegree']}°C',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                (Get.height * Get.width) / 7500,
                                            color: Colors.white),
                                      );
                                    } else {
                                      return Text(
                                        '---°C',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                (Get.height * Get.width) / 7500,
                                            color: Colors.white),
                                      );
                                    }
                                  }),
                            ),
                          ),
                          const Spacer(),
                        ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[850]),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.waves,
                                color: Colors.amber,
                                size: (Get.height * Get.width) / 9100,
                              ),
                              Text(
                                'Nem Oranı',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (Get.height * Get.width) / 15500,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: StreamBuilder<DocumentSnapshot>(
                                  stream: _firestore
                                      .collection('Gyms')
                                      .doc(prefs.read('gymuid').toString())
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        '%${snapshot.data!['gymHumidity']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              (Get.height * Get.width) / 7500,
                                          color: Colors.white,
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        '%---',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              (Get.height * Get.width) / 7500,
                                          color: Colors.white,
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          ),
                          const Spacer(),
                        ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[850]),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Center(
                            child: Text(
                              'Kalan Üyelik\nSüresi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (Get.height * Get.width) / 14000,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GetX<MemberController>(
                            init: MemberController(),
                            initState: (_) async {
                              Get.find<MemberController>().member =
                                  await Database().getmember();
                            },
                            builder: (_) {
                              if (_.member.memberDays != null) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: LinearProgressIndicator(
                                    value:
                                        (_.member.memberDays! / 365).toDouble(),
                                    color: Colors.amber,
                                    backgroundColor: Colors.grey,
                                  ),
                                );
                              } else {
                                return LinearProgressIndicator(
                                  value: (0 / 365).toDouble(),
                                  color: Colors.amber,
                                  backgroundColor: Colors.grey,
                                );
                              }
                            },
                          ),
                          Center(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                          fontSize:
                                              (Get.height * Get.width) / 8500,
                                          color: Colors.white),
                                    );
                                  },
                                )),
                          ),
                          const Spacer(),
                        ]),
                  ),
                  StreamBuilder<DocumentSnapshot>(
                      stream: _firestore
                          .collection('Gyms')
                          .doc(prefs.read('gymuid').toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[850]),
                          padding: const EdgeInsets.all(8),
                          child: Column(children: [
                            SizedBox(
                              height: Get.height / 12,
                              width: Get.width,
                              child: Image.network(
                                  snapshot.data!['gymUrl'].toString()),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                SizedBox(
                                  height: Get.height / 15,
                                  width: Get.width / 10,
                                  child: GestureDetector(
                                    child: Image.network(
                                        'https://res.cloudinary.com/duhzykhah/image/upload/v1672761811/360_F_512566120_BAMGElVHqQfK7ggkxbDePJHRN1ZueKQe-removebg-preview_jskvdm.png'),
                                    onTap: () async {
                                      await launchUrl(Uri.parse(
                                          snapshot.data!['gymInstagram']));
                                    },
                                  ),
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                                SizedBox(
                                  height: Get.height / 15,
                                  width: Get.width / 10,
                                  child: GestureDetector(
                                    child: Image.network(
                                        'https://res.cloudinary.com/duhzykhah/image/upload/v1672761586/indir_j5wmjv.png'),
                                    onTap: () async {
                                      await launchUrl(Uri.parse(
                                          snapshot.data!['gymTwitter']));
                                    },
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const Spacer(),
                          ]),
                        );
                      })
                ],
              ),
            ),
          ],
        ));
  }
}
