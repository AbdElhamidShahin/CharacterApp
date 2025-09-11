import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

import '../../../constance/my-colors.dart';

Widget DesplayCararcterRendomEmpty(Caracter caracter) {
  return Center(
    child: DefaultTextStyle(
      style: TextStyle(
        shadows: [
          Shadow(
            blurRadius: 7.0,
            color: myColors.myYello,
            offset: Offset(0, 0),
          ),
        ],
        color: myColors.myWhite,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [FlickerAnimatedText(caracter.name ?? "Unknown")],
      ),
    ),
  );
}
