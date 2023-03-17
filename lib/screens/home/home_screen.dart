import 'package:app_study/configs/themes/app_colors.dart';
import 'package:app_study/configs/themes/app_icons.dart';
import 'package:app_study/configs/themes/custom_text_style.dart';
import 'package:app_study/configs/themes/ui_parameters.dart';
import 'package:app_study/controllers/question_paper/question_paper_controller.dart';
import 'package:app_study/controllers/zoom_drawer_controller.dart';
import 'package:app_study/screens/home/menu_screen.dart';
import 'package:app_study/screens/home/question_card.dart';
import 'package:app_study/widgets/app_circle_button.dart';
import 'package:app_study/widgets/content_area.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_){
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          menuScreenWidth: double.maxFinite,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          menuBackgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width*0.6,
          menuScreen: MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(

                          child: const Icon(AppIcons.menuLeft,),
                          onTap: controller.toggleDrawer,
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(AppIcons.peace, ),
                              Text(
                                'Hello friend',
                                style: detailText.copyWith(
                                    color: onSurfaceTextColor
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'What do you want learn today?',
                          style: headerText,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                              () => ListView.separated(
                              padding: UIParameters.mobileScreenPadding,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(model: _questionPaperController.allPapers[index],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(height: 20);
                              },
                              itemCount: _questionPaperController.allPapers.length),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        );
      }),
    );
  }
}
