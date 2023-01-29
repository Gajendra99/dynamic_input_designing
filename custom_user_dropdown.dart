import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'appValues.dart';

class CustomUserDropDown extends StatelessWidget {
  // final IconData? Icons;

  int id;
  String title;
  bool? isConsumerController;
  double? width;
  double? height;
  bool? showTitle;
  double? borderRadius;

  CustomUserDropDown({
    Key? key,
    this.width,
    this.height,
    this.showTitle,
    this.isConsumerController,
    required this.id,
    required this.title,
    this.borderRadius,
  }) : super(key: key);
  double dropdownHeight = 30.0;
  @override
  Widget build(BuildContext context) {
    isConsumerController ??= false;

    return Container(
      padding: showTitle == null
          ? EdgeInsets.only(
              top: AppValues.inputTopSpacing,
              left: AppValues.inputHorizontalPadding,
              right: AppValues.inputHorizontalPadding,
            )
          : EdgeInsets.only(),
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showTitle == null
              ? Text(
                  title,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: AppValues.inputHintFontSize),
                )
              : SizedBox(
                  height: 0,
                  width: 0,
                ),
          SizedBox(
            height: showTitle == null ? 3 : 0,
          ),
          SizedBox(
              width: width ?? Get.width / 2,
              height: height ?? dropdownHeight,
              // height: AppValues.inputBoxHeight,
              child: Container(
                padding: const EdgeInsets.only(
                  left: AppValues.inputPaddingLeft,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), //<-- SEE HERE
                  borderRadius:
                      BorderRadius.circular(AppValues.inputBorderRadius),
                ),
                child: DropdownButtonHideUnderline(
                    child: Container(
                        decoration: const BoxDecoration(border: Border()),
                        child: ButtonTheme(
                          child: DropdownButton(
                            // itemHeight: dropdownHeight,
                            hint: Text(
                              title,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: AppValues.inputTextFontSize,
                                color: Colors.black,
                              ),
                            ),
                            value: AppValues.dropdownvalue,
                            items: AppValues.items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        textAlign: TextAlign.center,
                                        maxLines: 6,
                                        style: const TextStyle(
                                          fontSize: AppValues.inputTextFontSize,
                                        ),
                                      ),
                                    ))
                                .toList(),

                            onChanged: (value) {
                              print(value);
                              print(id.toString());
                            },
                          ),
                        ))),
              ))
        ],
      ),
    );
  }
}
