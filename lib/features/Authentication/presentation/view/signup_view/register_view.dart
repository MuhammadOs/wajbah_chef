import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/line_md.dart';
import 'package:iconify_flutter/icons/prime.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/login_view/login_view.dart';
import 'dart:io';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/sizeConfig.dart';
import '../../../../../core/styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';

class MultiStepRegistration extends StatefulWidget {
  const MultiStepRegistration({Key? key}) : super(key: key);

  @override
  State<MultiStepRegistration> createState() => _MultiStepRegistrationState();
}

class _MultiStepRegistrationState extends State<MultiStepRegistration> {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var nationalIdController = TextEditingController();
  var cityController = TextEditingController();
  var streetController = TextEditingController();
  var buildingController = TextEditingController();
  var floorController = TextEditingController();
  var flatController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var bankAccountController = TextEditingController();
  var kitchenController = TextEditingController();
  var descriptionController = TextEditingController();
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
        currentStep = currentStep + 1;
      });
    } else if (currentStep == 2) {
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (c) {
            return const LoginView();
          },
        ));
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
    double height = SizeConfig.screenH!;
    double defaultPadding = SizeConfig.defaultPadding!;
    double fontSize = SizeConfig.fontSize!;
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.15,
            height: height * 0.05,
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
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.6,
            height: height * 0.05,
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
                ),
              ),
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
    double height = SizeConfig.screenH!;
    double defaultPadding = SizeConfig.defaultPadding!;
    double fontSize = SizeConfig.fontSize!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(defaultPadding * 2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15,),
              CustomAppBar(
                title: "Register",
                showBackButton: false,
              ),
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
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: firstnameController,
                                        hintText: "First name",
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: lastnameController,
                                        hintText: "Last name",
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: AbsorbPointer(
                                    child: CustomTextField(
                                      usernameController: _birthdateController,
                                      hintText: "Birthdate",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextField(
                                  usernameController: nationalIdController,
                                  hintText: "National ID",
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: cityController,
                                        hintText: "City",
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: streetController,
                                        hintText: "Street",
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: buildingController,
                                        hintText: "Building no.",
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: floorController,
                                        hintText: "Floor no.",
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: flatController,
                                        hintText: "Flat no.",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.08,
                                )
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
                      title: const Text('Security'),
                      content: SingleChildScrollView(
                        child: Center(
                          child: Form(
                            key: securityFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                CustomTextField(
                                  usernameController: emailController,
                                  hintText: "Email",
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextField(
                                  usernameController: phoneNumberController,
                                  hintText: "Phone number",
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                PasswordTextField(
                                  passwordController: passwordController,
                                  hidePassword: true,
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  hintText: "Password",
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                PasswordTextField(
                                  passwordController: rePasswordController,
                                  hidePassword: true,
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  hintText: "Re-enter password",
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                CustomTextField(
                                  usernameController: bankAccountController,
                                  hintText: "Bank account",
                                ),
                                SizedBox(
                                  height: height * 0.1,
                                ),
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
                                        height: height * 0.2,
                                        width: height * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.transparent),
                                          color: wajbah_gray_light,
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: _profileImage != null
                                                ? Image.file(
                                                    _profileImage!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    "assets/images/authentication/chef_image.png")),
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
                                                        SizedBox(
                                                          height: SizeConfig
                                                              .defaultPadding,
                                                        ),
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
                                            padding:
                                                EdgeInsets.all(defaultPadding),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                CustomTextField(
                                  usernameController: kitchenController,
                                  hintText: "Kitchen name",
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextField(
                                  usernameController: descriptionController,
                                  hintText: "Description",
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Checkbox(
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        'I agree to the Terms & Conditions and Privacy Policy',
                                        textAlign: TextAlign.center,
                                        style: Styles.hint
                                            .copyWith(fontSize: fontSize),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.097,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      isActive: currentStep >= 0,
                      state: currentStep >= 3
                          ? StepState.complete
                          : StepState.editing,
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
                        .copyWith(color: wajbah_gray, fontSize: fontSize),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      'Login',
                      style: Styles.titleSmall
                          .copyWith(color: wajbah_primary, fontSize: fontSize),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
