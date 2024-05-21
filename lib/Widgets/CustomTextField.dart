import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_4a/Widgets/CustomColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField {
  static Widget customTextField({
    required BuildContext context,
    required String text,
    required String imageIcon,
    required bool obscuretext,
    required int maxLengths,
    required double textfieldHeight,
    required double textfieldWidth,
    required double radius,
    required double insideText,
    required TextInputType keyboardtype,
    TextEditingController? controllers,
    void Function(String value)? onChangedFunc,
  }) {
    late double screenWidth;
    late double screenHeight;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, designSize: const Size(1440, 900));  // Ensure ScreenUtil is initialized
    ScreenUtil size = ScreenUtil();

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.01,
        right: screenWidth * 0.01,
        top: screenHeight * 0.01,
      ),
      child: Container(
        alignment: Alignment.center,
        height: textfieldHeight, // Set container height
        width: textfieldWidth,   // Set container width
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: CustomColors.accentWhite,
            width: screenWidth * 0.001,
          ),
        ),
        child: Center(
          child: TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            controller: controllers,
            keyboardType: keyboardtype,
            onChanged: (value) {
              if (onChangedFunc != null) {
                onChangedFunc(value.trim());
              }
            },
            obscureText: obscuretext,
            maxLines: maxLengths,
            style: TextStyle(
              color: Colors.black,
              fontSize: insideText.toDouble(),
            ),
            enableSuggestions: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: CustomColors.accentWhite,
                  width: screenWidth * 0.001,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: CustomColors.accentWhite,
                  width: screenWidth * 0.001,
                ),
              ),
              suffixIcon: imageIcon.isNotEmpty
                  ? Container(
                height: size.setHeight(30),
                width: size.setWidth(40),
                margin: EdgeInsets.all(size.setWidth(5)),
                child: Image.asset(
                  imageIcon,
                  height: size.setHeight(28),
                  width: size.setWidth(38),
                ),
              )
                  : null,
              errorStyle: TextStyle(
                fontSize: insideText,
              ),
              filled: true,
              fillColor: CustomColors.accentWhite,
              hintText: text,
              hintStyle: TextStyle(
                color: CustomColors.purple2,
                fontWeight: FontWeight.w400,
                fontSize: insideText,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.01,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: screenWidth * 0.001,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: CustomColors.accentWhite,
                  width: screenWidth * 0.001,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
