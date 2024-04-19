import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../sizeConfig.dart';
import '../styles.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title, this.showBackButton = true});

  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenW!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenWidth * 0.046),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showBackButton
              ? const Flexible(flex: 1, child: CustomBackButton())
              : Container(),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.07),
              child: Text(
                title,
                style: Styles.titleLarge.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
