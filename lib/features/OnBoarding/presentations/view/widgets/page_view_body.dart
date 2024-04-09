import 'package:flutter/material.dart';

import '../../../../../core/sizeConfig.dart';
import '../../../data/onboarding_data.dart';
import 'onboarding_discription.dart';
import 'onboarding_titles.dart';

class PageViewBody extends StatefulWidget {
  const PageViewBody({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    debugPrint("$width");
    debugPrint("$height");
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.06, bottom: height * 0.02),
          child: Image.asset(
            content[widget.index].image,
            width: width,
            height: height / 3,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnboardingTitles(
                index: widget.index,
              ),
              SizedBox(
                height: height * 0.005,
              ),
              OnboardingDiscription(
                index: widget.index,
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        )
      ],
    );
  }
}
