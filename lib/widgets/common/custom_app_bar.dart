import 'package:app_study/configs/themes/ui_parameters.dart';
import 'package:app_study/screens/question/test_overview_screen.dart';
import 'package:app_study/widgets/app_circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({Key? key,
    this.title = "",
    this.showActionIcon = false,
    this.leading,
    this.titleWidget,
    this.onMenuActionTap

  }) : super(key: key);
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mobileScreenPadding,
          vertical: mobileScreenPadding/1.2
        ),
        child: Stack(
            children: [
              Positioned.fill(
                  child: titleWidget == null ?Center(
                    child: Text(
                      title, style: appBarTS,
                    ),
                  ): Center(child:titleWidget ) ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading?? Transform.translate(offset: const Offset(-14, 0),
                    child: BackButton(),
                  ),
                  if(showActionIcon)
                    Transform.translate(offset: Offset(10,0),
                    child: AppCircleButton(
                      child: Icon(AppIcons.menu),
                      onTap: onMenuActionTap?? ()=> Get.toNamed(TestOverviewScreen.routeName),
                    ),
                    ),
                ],
              )
            ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
      double.maxFinite,
      80
  );
}
