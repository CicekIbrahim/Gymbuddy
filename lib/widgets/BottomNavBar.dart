import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/home.dart';

import '../landingPageController.dart';
import '../profile.dart';

class LandingPage extends StatelessWidget {
  buildBottomNavigationMenu(context, landingPageController) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const SafeArea(
          child: Material(
            color: Colors.black,
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.black45,
              tabs: [
                Tab(child: Icon(Icons.home_outlined, color: Colors.white)),
                Tab(child: Icon(Icons.person_outline, color: Colors.white))
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Home(),
            Profile(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              Home(),
              Profile(),
            ],
          )),
    ));
  }
}
