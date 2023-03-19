import 'package:app_study/controllers/question_paper/question_controller.dart';
import 'package:app_study/controllers/question_paper/question_paper_controller.dart';
import 'package:app_study/screens/home/home_screen.dart';
import 'package:app_study/screens/introduction/introduction.dart';
import 'package:app_study/screens/login/login_screen.dart';
import 'package:app_study/screens/question/answer_check_screen.dart';
import 'package:app_study/screens/question/question_screen.dart';
import 'package:app_study/screens/question/result_screen.dart';
import 'package:app_study/screens/question/test_overview_screen.dart';
import 'package:app_study/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../controllers/zoom_drawer_controller.dart';

class AppRoutes {
  static List<GetPage> routes() => [
    GetPage(name: "/", page: () => const SplashScreen()),
    GetPage(
      name: "/introduction",
      page: () => const AppIntroductionScreen(),
    ),
    GetPage(
        name: "/home",
        page: () => const HomeScreen(),
        binding: BindingsBuilder(() {
          Get.put(QuestionPaperController());
          Get.put(MyZoomDrawerController());
        })),
    GetPage(
        name: LoginScreen.routeName,
        page: ()=>LoginScreen()
    ),
    GetPage(
        name: QuestionsScreen.routeName,
        page: ()=>QuestionsScreen(),
        binding: BindingsBuilder((){
          Get.put<QuestionsController>(QuestionsController());
        })
    ),
    GetPage(
        name: TestOverviewScreen.routeName,
        page: ()=> const TestOverviewScreen()
    ),
    GetPage(
        name: ResultScreen.routeName,
        page: ()=> const ResultScreen()
    ),
    GetPage(
        name: AnswerCheckScreen.routeName,
        page: ()=> AnswerCheckScreen()
    )
  ];
}