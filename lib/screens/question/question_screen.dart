import 'package:app_study/configs/themes/app_colors.dart';
import 'package:app_study/configs/themes/custom_text_style.dart';
import 'package:app_study/configs/themes/ui_parameters.dart';
import 'package:app_study/controllers/question_paper/question_controller.dart';
import 'package:app_study/firebase_ref/loading_status.dart';
import 'package:app_study/screens/question/test_overview_screen.dart';
import 'package:app_study/widgets/common/background_decoration.dart';
import 'package:app_study/widgets/common/main_button.dart';
import 'package:app_study/widgets/content_area.dart';
import 'package:app_study/widgets/questions/answer_card.dart';
import 'package:app_study/widgets/questions/countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/qusetion_place_holder.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          leading: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: ShapeDecoration(
                shape: StadiumBorder(
                  side:  BorderSide(color: onSurfaceTextColor, width: 2)
                )
            ),
            child: Obx(() => CountdownTimer(
                time: controller.time.value,
                color: onSurfaceTextColor,
            ))
          ),
        showActionIcon: true,
        titleWidget: Obx(
            () => Text(
            "Q. ${(controller.questionIndex.value+1).toString().padLeft(2, '0')}",
            style: appBarTS,
          ),
        )
      ),
      body: BackgroundDecoration(
          child: Obx(() => Column(
                children: [
                  if (controller.loadingStatus.value == LoadingStatus.loading)
                    const Expanded(
                        child: ContentArea(child: QuestionScreenHolder())),
                  if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                        child: ContentArea(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: questionTs,
                            ),
                            GetBuilder<QuestionsController>(
                                id: "answers_list",
                                builder: (context) {

                              return ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 25),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    return AnswerCard(
                                        answer: "${answer.identifier}. ${answer.answer}",
                                        onTap: () {
                                          controller.selectedAnswer(
                                              answer.identifier);
                                        },
                                      isSelected: answer.identifier ==
                                          controller.currentQuestion.value!.selectedtAnswer,
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(height: 10),
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length);
                            }),

                          ],
                        ),
                      ),
                    )),
                  ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: UIParameters.mobileScreenPadding,
                      child: Row(
                        children: [
                          Visibility(
                            visible: controller.isFirstQuestion,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: SizedBox(
                                width: 55,
                                height: 55,
                                child: MainButton(
                                  onTap: (){
                                    controller.prevQuestion();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Get.isDarkMode?onSurfaceTextColor:Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Visibility(
                                visible: controller.loadingStatus.value ==
                                    LoadingStatus.completed,
                                child: MainButton(
                              onTap: (){
                                controller.isLastQuestion?Get.toNamed(TestOverviewScreen.routeName):
                                controller.nextQuestion();
                              },
                              title: controller.isLastQuestion? 'Complete' : 'Next',
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
