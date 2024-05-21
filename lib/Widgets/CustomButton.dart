import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomColor.dart';

class CustomButton {

  static Widget customizedElevatedButton({
    required BuildContext context,
    required String text,
    required double radius,
    required Color color,
    required Color textColor,
    required double textSize,
    required double height,
    required double width,
    required void Function() onPressedFunc,
  }) {
    late double screenWidth;
    late double screenHeight;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: CustomColors.white,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius), // Adjust border radius as needed
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor,
              fontSize: textSize,// size.setSp(16),
              fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          onPressedFunc();
        },
      ),
    );
  }

}
