import 'package:aitradevelopmentprivateltdassignmentapp/core/colors.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/router/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return GetMaterialApp(
      title: 'Aitra Development Private Limited - Assignment App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
        useMaterial3: true,
        fontFamily: 'Poppins'
      ),
      getPages: AppScreens.SCREENS,
      initialRoute: AppScreens.INITIAL,
    );
  }
}
