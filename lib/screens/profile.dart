import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: SizedBox(
                height: Get.height / 8,
                child: ClipOval(
                  child: Image.network(controller.ppUrl.string),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${controller.userName}",
                style: TextStyle(
                    fontSize: (Get.height * Get.width) / 7000,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${controller.userID}",
                style: TextStyle(
                    fontSize: (Get.height * Get.width) / 14000,
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
                      Get.offAndToNamed('/landing');
                    },
                    label: const Text('Profili DÜzenle'))),
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
                            child: Obx(() => LinearProgressIndicator(
                                  value: (controller.days / 365).toDouble(),
                                  color: Colors.amber,
                                  backgroundColor: Colors.grey,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 0, 8),
                      child: Obx(() => Text(
                            '${controller.days.value} Gün',
                            style: TextStyle(
                                fontSize: (Get.height * Get.width) / 15000,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Get.offAndToNamed('/opening'),
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
