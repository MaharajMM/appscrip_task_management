import 'package:appscrip_task_management/const/padding/app_padding.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class GlobalBackButton extends StatelessWidget {
  const GlobalBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.maybePop();
      },
      child: Padding(
        padding: AppPadding.kHalfPad,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
    );
  }
}
