import 'package:app_study/configs/themes/app_dark_theme.dart';
import 'package:app_study/configs/themes/app_light_theme.dart';
import 'package:app_study/controllers/theme.controller.dart';
import 'package:app_study/data_uploader_screen.dart';
import 'package:app_study/routes/app_routes.dart';
import 'package:app_study/screens/introduction/introduction.dart';
import 'package:app_study/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initial_bindings.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

/*Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home: DataUploaderScreen()));
}*/
