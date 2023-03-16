import 'package:app_study/controllers/auth_controller.dart';
import 'package:app_study/services/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../controllers/theme.controller.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    // Get.put(NotificationService());
    Get.lazyPut(() =>  FirebaseStorageService());
  }

}