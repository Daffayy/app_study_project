import 'package:app_study/controllers/auth_controller.dart';
import 'package:app_study/firebase_ref/references.dart';
import 'package:app_study/models/question_paper_model.dart';
import 'package:app_study/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../screens/question/question_screen.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  // Future <void> getAllPapers() async {
  //   List<String> imgName = ["biology", "chemistry", "maths", "physics"];
  //   try {
  //     for (var img in imgName) {
  //       final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
  //       allPaperImages.add(imgUrl!);
  //     }
  //   } catch (e) {}

  Future<void> getAllPapers() async {
    List<String> imgName = ['biology', 'chemistry', 'maths', 'physics'];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      Logger().e(e);
    }
  }
  void navigateToQuestions ({required QuestionPaperModel paper, bool tryAgain = false }){
    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      if (tryAgain) {
        Get.back();
        Get.toNamed(QuestionsScreen.routeName, arguments: paper, preventDuplicates: false);
      }else{
        print("logged in");
        Get.toNamed(QuestionsScreen.routeName, arguments: paper );
      }
    }else{
      print('The title is ${paper.title}');
      _authController.showLoginAlertDialogue();
    }
  }

}
