import 'package:flutter/material.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/sizeConfig.dart';
import '../../../../../../core/styles.dart';
import '../../widgets/custom_button.dart';
import '../widgets/permissions_body.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerification();
}

class _EmailVerification extends State<EmailVerification> {
  var verificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    debugPrint("$width");
    debugPrint("$height");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Reset Password",
              style: Styles.titleMedium.copyWith(fontSize: 20),
            ),
            PermissionsBody(
                width: width,
                height: height,
                image: 'assets/images/email_verification.png',
                mainText: 'Enter verification code',
                subText:
                    '\t\tWe\'ll send you a 4-digit code to verify\nyour email address'),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50.0, // Set the width and height to make it square
                      height: 50.0,
                      child: TextFormField(
                        controller: verificationController,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          counterText: '',
                          labelStyle: Styles.titleSmall.copyWith(
                            color: wajbah_black,
                          ),
                          filled: true,
                          fillColor: wajbah_buttons,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_gray,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_gray,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_buttons,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          value.toString();
                          debugPrint(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 50.0, // Set the width and height to make it square
                      height: 50.0,
                      child: TextFormField(
                        controller: verificationController,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          counterText: '',
                          labelStyle: Styles.titleSmall.copyWith(
                            color: wajbah_black,
                          ),
                          filled: true,
                          fillColor: wajbah_buttons,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_gray,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_gray,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_buttons,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          value.toString();
                          debugPrint(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 50.0, // Set the width and height to make it square
                      height: 50.0,
                      child: TextFormField(
                        controller: verificationController,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          counterText: '',
                          labelStyle: Styles.titleSmall.copyWith(
                            color: wajbah_black,
                          ),
                          filled: true,
                          fillColor: wajbah_buttons,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_gray,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_gray,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_buttons,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          value.toString();
                          debugPrint(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 50.0, // Set the width and height to make it square
                      height: 50.0,
                      child: TextFormField(
                        controller: verificationController,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          counterText: '',
                          labelStyle: Styles.titleSmall.copyWith(
                            color: wajbah_black,
                          ),
                          filled: true,
                          fillColor: wajbah_buttons,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_gray,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_gray,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: wajbah_buttons,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          value.toString();
                          debugPrint(value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive a code?',
                      style: Styles.titleSmall
                          .copyWith(color: wajbah_gray, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        //Navigator.pushReplacementNamed(context, 'register');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text('send again',
                          style: Styles.titleSmall
                              .copyWith(color: wajbah_primary, fontSize: 14)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: width * 0.8,
                height: 50,
                child: const CustomButton(
                    color: wajbah_primary, text: "Verify Email")),
          ],
        ),
      ),
    );
  }
}
