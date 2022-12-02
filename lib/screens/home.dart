import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../controllers/landingPageController.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(Controller());
  final landingcontroller = Get.put(LandingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 50, 85, 8),
                  child: Text(
                    "Merhaba \n${controller.userName}",
                    style: TextStyle(
                        fontSize: (Get.height * Get.width) / 7000,
                        color: Colors.white),
                  ),
                ),
                Obx(() => GestureDetector(
                      onTap: () {
                        landingcontroller.tabIndex.value = 1;
                      },
                      child: SizedBox(
                        height: Get.height / 12,
                        child: ClipOval(
                          child: Image.network(controller.ppUrl.string),
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 0, 8),
              child: Text(
                "Şuanda ",
                style: TextStyle(
                    fontSize: (Get.height * Get.width) / 9000,
                    color: Colors.white),
              ),
            ),
            Padding(
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
                      child: Obx(() => Text(
                            '%${((controller.inside.value * 100) / controller.totalp.value).toStringAsFixed(1)}',
                            style: TextStyle(
                                fontSize: (Get.height * Get.width) / 15000,
                                color: Colors.white),
                          )),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Obx(() => LinearProgressIndicator(
                                  value: (controller.inside.value /
                                          controller.totalp.value)
                                      .toDouble(),
                                  color: Colors.amber,
                                  backgroundColor: Colors.grey,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 5, 0, 8),
                      child: Obx(() => Text(
                            '${controller.inside.value} Kişi',
                            style: TextStyle(
                                fontSize: (Get.height * Get.width) / 15000,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
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
                              child: Obx(() => Text(
                                    '${controller.degree.value}°C',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            (Get.height * Get.width) / 7500,
                                        color: Colors.white),
                                  )),
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
                                size: (Get.height * Get.width) / 8000,
                              ),
                              Text(
                                'Nem Oranı',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (Get.height * Get.width) / 14000,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                '%${controller.humid.value}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: (Get.height * Get.width) / 7500,
                                  color: Colors.white,
                                ),
                              ),
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
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Obx(() => Text(
                                    '${controller.days.value} Gün',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            (Get.height * Get.width) / 8500,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                          const Spacer(),
                        ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: const AssetImage("lib/Image/male.png")),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Center(
                            child: Text(
                              'Soyunma Odası Doluluğu',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (Get.height * Get.width) / 14000,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Obx(() => Text(
                                    '%${((controller.inside.value * 100) / controller.totalp.value).toStringAsFixed(1)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            (Get.height * Get.width) / 8500,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                          const Spacer(),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
