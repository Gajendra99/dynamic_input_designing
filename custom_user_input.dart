import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appValues.dart';

class CustomUserInput extends StatelessWidget {
  // final IconData? Icons;
  int id;
  String title;
  bool? isConsumerController;
  String hintText;
  CustomUserInput({
    Key? key,
    required this.id,
    this.isConsumerController,
    required this.title,
    required this.hintText,
  }) : super(key: key);
  double borderRadius = 5.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: AppValues.inputTopSpacing,
        left: AppValues.inputHorizontalPadding,
        right: AppValues.inputHorizontalPadding,
      ),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.blackColor.withOpacity(AppValues.ColorOpacity),
        //     blurRadius: 2,
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.grey, fontSize: AppValues.inputHintFontSize),
          ),
          SizedBox(
            height: 3,
          ),
          SizedBox(
            width: Get.width,
            // height: AppValues.inputBoxHeight,
            child: TextField(
              onChanged: (value) {
                print(value.toString());
              },
              style: TextStyle(
                fontSize: AppValues.inputHintFontSize,
              ),
              decoration: InputDecoration(
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                  borderRadius:
                      BorderRadius.circular(AppValues.inputBorderRadius),
                ),
                contentPadding: EdgeInsets.only(
                  left: AppValues.inputPaddingLeft,
                  top: AppValues.inputPaddingTop,
                  bottom: AppValues.inputPaddingBottom,
                ),
                hintText: title,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                  borderRadius:
                      BorderRadius.circular(AppValues.inputBorderRadius),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
