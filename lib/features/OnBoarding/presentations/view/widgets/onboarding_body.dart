import 'package:flutter/material.dart';
import 'package:wajbah_chef/features/OnBoarding/data/onboarding_data.dart';
import 'package:wajbah_chef/features/OnBoarding/presentations/view/widgets/page_view_body.dart';
import '../../../../../core/sizeConfig.dart';
import 'custom_next_button.dart';
import 'onboarding_dots.dart';
import 'onboarding_login_button.dart';
import 'onboarding_register_skip_button.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.62,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      // Check if the current page is the last page
                      index == content.length - 1
                          ? isLastPage = true
                          : isLastPage = false;
                    });
                  },
                  controller: controller,
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return PageViewBody(index: index);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01, left: width * 0.03),
              child: OnboardingDots(controller: controller),
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.05, right: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingRegisterSkipButton(
                        isLastPage: isLastPage, controller: controller),
                    isLastPage
                        ? const OnboardingLoginButton()
                        : CustomNextButton(controller: controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
