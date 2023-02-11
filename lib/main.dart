import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymbuddy/view/bindings/loginbinding.dart';
import 'package:gymbuddy/view/home.dart';
import 'package:gymbuddy/view/login.dart';
import 'package:gymbuddy/view/opening.dart';
import 'package:gymbuddy/view/profile.dart';
import 'package:gymbuddy/widgets/LandingPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GymBuddy',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
      home: OpeningPage(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/landing', page: () => LandingPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/login', page: () => LoginPage(),binding: LoginBinding()),
        GetPage(name: '/opening', page: () => OpeningPage()),
        GetPage(
            name: '/profile',
            page: () => ProfilePage(),
            transition: Transition.zoom),
      ],
    );
  }
}
