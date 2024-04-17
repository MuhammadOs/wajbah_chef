import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/sizeConfig.dart';
import '../../../../../core/styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';

class MultiStepRegistration extends StatefulWidget {
  const MultiStepRegistration({super.key});

  @override
  State<MultiStepRegistration> createState() => _MultiStepRegistrationState();
}

class _MultiStepRegistrationState extends State<MultiStepRegistration> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var personalFormKey = GlobalKey<FormState>();
  var securityFormKey = GlobalKey<FormState>();
  var profileFormKey = GlobalKey<FormState>();

  bool isPassword = true;

  int currentStep = 0;
  File? _profileImage;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1; //currentStep+=1;
      });
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1; //currentStep-=1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlBuilders(context, details) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.15,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: wajbah_primary,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: details.onStepCancel,
              child: const Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.6,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: wajbah_primary,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: details.onStepContinue,
              child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController _birthdateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',
                  style: Styles.titleMedium.copyWith(color: wajbah_black)),
              Expanded(
                flex: 9,
                child: Stepper(
                  elevation: 0,
                  controlsBuilder: controlBuilders,
                  type: StepperType.horizontal,
                  physics: const ScrollPhysics(),
                  onStepTapped: onStepTapped,
                  onStepContinue: continueStep,
                  onStepCancel: cancelStep,
                  currentStep: currentStep,
                  steps: [
                    Step(
                        title: const Text('Personal'),
                        content: SingleChildScrollView(
                          child: Center(
                            child: Form(
                              key: personalFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          usernameController:
                                              usernameController,
                                          hintText: "First name",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                          usernameController:
                                              usernameController,
                                          hintText: "Last name",
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: AbsorbPointer(
                                      child: CustomTextField(
                                        usernameController:
                                            _birthdateController,
                                        hintText: "Birthdate",
                                      ),
                                    ),
                                  ),
                                  /*CustomTextField(
                                    usernameController: usernameController,
                                    hintText: "Birthdate",
                                  ),*/
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  CustomTextField(
                                    usernameController: usernameController,
                                    hintText: "National ID",
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          usernameController:
                                              usernameController,
                                          hintText: "City",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                          usernameController:
                                              usernameController,
                                          hintText: "Street",
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          usernameController:
                                              usernameController,
                                          hintText: "Building no.",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                          usernameController:
                                              usernameController,
                                          hintText: "Floor no.",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                          usernameController:
                                              usernameController,
                                          hintText: "Flat no.",
                                        ),
                                      ),
                                    ],
                                  ),
                                  /*PasswordTextField(
                                    passwordController: passwordController,
                                    isPassword: isPassword,
                                    onPressed: () {
                                      setState(() {
                                        isPassword = !isPassword;
                                      });
                                    },
                                    hintText: "Password",
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  PasswordTextField(
                                    passwordController: passwordController,
                                    isPassword: isPassword,
                                    onPressed: () {
                                      setState(() {
                                        isPassword = !isPassword;
                                      });
                                    },
                                    hintText: "Re-enter password",
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  CustomTextField(
                                    usernameController: usernameController,
                                    hintText: "Referral code (optional)",
                                  ),*/
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Checkbox(
                                              value: true,
                                              onChanged: (value) {})),
                                      Expanded(
                                        flex: 10,
                                        child: Text(
                                            'I agree to the Terms & Conditions and Privacy Policy',
                                            textAlign: TextAlign.center,
                                            style: Styles.hint
                                                .copyWith(fontSize: 12)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  /*Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: width * 0.7,
                                          height: 60,
                                          child: CustomButton(
                                            color: wajbah_primary,
                                            text: "Create Account",
                                            onPressed: () {
                                              setState(() {
                                                if (formkey.currentState!
                                                    .validate()) {
                                                  debugPrint(
                                                      passwordController
                                                          .text);
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (c) {
                                                      return const AllowNotification();
                                                    },
                                                  ));
                                                }
                                              });
                                            },
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        ),
                        isActive: currentStep >= 0,
                        state: currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled),
                    Step(
                      title: const Text('Security'),
                      content: SingleChildScrollView(
                        child: Center(
                          child: Form(
                            key: securityFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 40.0,
                                ),
                                CustomTextField(
                                  usernameController: usernameController,
                                  hintText: "Email",
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomTextField(
                                  usernameController: usernameController,
                                  hintText: "Phone number",
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                PasswordTextField(
                                  passwordController: passwordController,
                                  isPassword: isPassword,
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  hintText: "Password",
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                PasswordTextField(
                                  passwordController: passwordController,
                                  isPassword: isPassword,
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  hintText: "Re-enter password",
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CustomTextField(
                                  usernameController: usernameController,
                                  hintText: "Bank account",
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Checkbox(
                                            value: true,
                                            onChanged: (value) {})),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                          'I agree to the Terms & Conditions and Privacy Policy',
                                          textAlign: TextAlign.center,
                                          style: Styles.hint
                                              .copyWith(fontSize: 12)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                /*Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: width * 0.7,
                                          height: 60,
                                          child: CustomButton(
                                            color: wajbah_primary,
                                            text: "Create Account",
                                            onPressed: () {
                                              setState(() {
                                                if (formkey.currentState!
                                                    .validate()) {
                                                  debugPrint(
                                                      passwordController
                                                          .text);
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (c) {
                                                      return const AllowNotification();
                                                    },
                                                  ));
                                                }
                                              });
                                            },
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),*/
                              ],
                            ),
                          ),
                        ),
                      ),
                      isActive: currentStep >= 0,
                      state: currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text('Profile'),
                      content: SingleChildScrollView(
                        child: Center(
                          child: Form(
                            key: profileFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    fit: StackFit.passthrough,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.transparent),
                                          color: wajbah_gray_light,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: _profileImage != null
                                              ? Image.file(
                                                  _profileImage!,
                                                  fit: BoxFit.cover,
                                                )
                                              : const Icon(Icons.person,
                                                  size: 80,
                                                  color: Colors.white),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -8.0,
                                        right: -8.0,
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Change Profile Picture'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        GestureDetector(
                                                          onTap: () {
                                                            _pickImage(
                                                                ImageSource
                                                                    .camera);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Take a Picture'),
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _pickImage(
                                                                ImageSource
                                                                    .gallery);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Choose from Gallery'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                CustomTextField(
                                  usernameController: usernameController,
                                  hintText: "Kitchen name",
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomTextField(
                                  usernameController: usernameController,
                                  hintText: "Description",
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Checkbox(
                                            value: true,
                                            onChanged: (value) {})),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                          'I agree to the Terms & Conditions and Privacy Policy',
                                          textAlign: TextAlign.center,
                                          style: Styles.hint
                                              .copyWith(fontSize: 12)),
                                    ),
                                  ],
                                ),
                                /*Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: width * 0.7,
                                          height: 60,
                                          child: CustomButton(
                                            color: wajbah_primary,
                                            text: "Create Account",
                                            onPressed: () {
                                              setState(() {
                                                if (formkey.currentState!
                                                    .validate()) {
                                                  debugPrint(
                                                      passwordController
                                                          .text);
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (c) {
                                                      return const AllowNotification();
                                                    },
                                                  ));
                                                }
                                              });
                                            },
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),*/
                              ],
                            ),
                          ),
                        ),
                      ),
                      isActive: currentStep >= 0,
                      state: currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?',
                    style: Styles.titleSmall
                        .copyWith(color: wajbah_gray, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text('Login',
                        style: Styles.titleSmall
                            .copyWith(color: wajbah_primary, fontSize: 14)),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
