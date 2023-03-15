import 'package:app_study/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/theme.controller.dart';

class InitialBindings implements Bindings {

  @override
  void dependencies (){
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}