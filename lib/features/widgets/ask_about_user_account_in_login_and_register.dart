import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AskUserWidgetInLoginRegister extends StatelessWidget {
  final String question;
  final String textButtonText;
  final GestureTapCallback onPressed;

  const AskUserWidgetInLoginRegister(
      {super.key,
      required this.question,
      required this.textButtonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: question,
            style: AppStyles.medium18White,
          ),
          TextSpan(
              text: textButtonText,
              style: AppStyles.bold18White,
              recognizer: TapGestureRecognizer()..onTap = onPressed),
        ]));
  }
}
