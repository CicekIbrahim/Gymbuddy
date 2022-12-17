import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/view/login.dart';

import '../controllers/landingPageController.dart';
import '../view/home.dart';
import '../view/profile.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(
      context, LandingPageController landingPageController) {
    return Obx(() => BottomNavigationBar(
          items: const [
            
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
          ],
          currentIndex: landingPageController.tabIndex.value,
          onTap: landingPageController.changeTabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white60,
          selectedIconTheme:
              IconThemeData(size: (Get.height * Get.width) / 10000),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomePage(),
              ProfilePage(),
            ],
          )),
    );
  }
}
