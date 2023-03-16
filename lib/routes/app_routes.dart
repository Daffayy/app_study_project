import 'package:app_study/controllers/question_paper/question_paper_controller.dart';
import 'package:app_study/screens/home/home_screen.dart';
import 'package:app_study/screens/introduction/introduction.dart';
import 'package:app_study/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

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
        })),
  ];
}