import 'package:flutter/material.dart';
import '../sizeConfig.dart';
import '../styles.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenW!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenWidth * 0.046),
      child: Row(
        children: [
          const CustomBackButton(),
          Expanded(
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
