import 'package:app_study/configs/themes/custom_text_style.dart';
import 'package:app_study/configs/themes/ui_parameters.dart';
import 'package:app_study/controllers/question_paper/question_controller.dart';
import 'package:app_study/screens/question/question_number_card.dart';
import 'package:app_study/widgets/common/background_decoration.dart';
import 'package:app_study/widgets/common/custom_app_bar.dart';
import 'package:app_study/widgets/common/main_button.dart';
import 'package:app_study/widgets/questions/answer_card.dart';
import 'package:app_study/widgets/questions/countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/content_area.dart';
import '../home/question_card.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
                child: ContentArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CountdownTimer(
                            color: UIParameters.isDarkMode()?
                            Theme.of(context).textTheme.bodyText1!.color
                                : Theme.of(context).primaryColor,
                            time: "",
                          ),
                          Obx(
                                  () => Text(
                                "${controller.time} Remaining",
                                style: countDownTimerTs(),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GridView.builder(
                          itemCount: controller.allQuestions.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: Get.width ~/ 75,
                              childAspectRatio: 1,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8
                          ),
                          itemBuilder: (_, index){
                            AnswerStatus? _answerStatus;
                            if(controller.allQuestions[index]
                                .selectedtAnswer!=null){
                              _answerStatus = AnswerStatus.answered;
                            }
                            return QuestionNumberCard(
                                index: index+1,
                                status: _answerStatus,
                                onTap: () => controller.jumpToQuestion(index)
                            );
                          }),
                    ],
                  ),
                )
            ),
            ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                    padding: UIParameters.mobileScreenPadding,
                    child: MainButton(
                        onTap: (){
                          controller.complete();
                        },
                      title: "Complete",
                    ),
                ),
            )
          ],
        )
      ),
    );
  }
}
