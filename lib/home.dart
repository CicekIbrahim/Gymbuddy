import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/profile.dart';

import 'controller.dart';

class Home extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: GestureDetector(
                child: Row(children: const [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  Text(
                    'Salon Seç',
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
                onTap: () {
                  controller.increment();
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 8, 85, 8),
                  child: Text(
                    "Merhaba \n${controller.userName}",
                    style: TextStyle(
                        fontSize: (Get.height * Get.width) / 7000,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Profile());
                  },
                  child: SizedBox(
                    height: Get.height / 12,
                    child: ClipOval(
                      child: Image.network(controller.ppUrl.string),
                    ),
                  ),
                )
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
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 0, 5),
                      child: Obx(() => Text(
                            '%${((controller.inside.value * 100) / controller.total.value).toStringAsFixed(1)}',
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
                                          controller.total.value)
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
                                color: Colors.white,
                                size: (Get.height * Get.width) / 8000,
                              ),
                              Text(
                                'Sıcaklık',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (Get.height * Get.width) / 13000),
                              )
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Obx(() => Text(
                                    '${controller.degree.value}°C',
                                    style: TextStyle(
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
                                color: Colors.white,
                                size: (Get.height * Get.width) / 8000,
                              ),
                              Text(
                                'Nem Oranı',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (Get.height * Get.width) / 14000),
                              )
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                '%${controller.humid.value}',
                                style: TextStyle(
                                    fontSize: (Get.height * Get.width) / 7500,
                                    color: Colors.white),
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
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[850],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Text('Who scream'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
