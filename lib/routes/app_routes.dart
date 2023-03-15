import 'package:app_study/screens/introduction/introduction.dart';
import 'package:app_study/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List <GetPage> routes ()=> [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/introduction',page: () => AppIntroductionScreen()),
  ];
}