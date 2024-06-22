import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/line_md.dart';
import 'package:iconify_flutter/icons/prime.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Address.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Chef.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Chef_register_request.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/login_view/login_view.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/widgets/custom_button.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_cubit.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_states.dart';
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
  var governerateController = TextEditingController();
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

  void _register() {
    if (!profileFormKey.currentState!.validate()) {
      return;
    }
    profileFormKey.currentState!.save();

    String birthDate =
        _selectedDate != null ? _selectedDate!.toIso8601String() : "";

    getAuthCubit(context).register(Chef(
      chefFirstName: userData['chefFirstName'],
      chefLastName: userData['chefLastName'],
      chefId: userData['chefId'],
      birthDate: birthDate,
      chefPromoCodes: userData['chefPromoCodes'],
      promoCodes: userData['promoCodes'],
      address: userData['address'],
      description: userData['description'],
      extraMenuItems: userData['extramenuItems'],
      menuItems: userData['menuItems'],
      profilePicture: 'String',
      rating: userData['rating'],
      wallet: userData['wallet'],
      restaurantName: userData['restaurantName'],
      phoneNumber: userData['phoneNumber'],
      email: userData['email'],
      password: userData['password'],
      role: userData['role'],
    ));
  }

  Map<String, dynamic> userData = {
    "phoneNumber": 0,
    "email": "",
    "password": "",
    "chefFirstName": "",
    "chefLastName": "",
    "birthDate": "",
    "chefId": "",
    "restaurantName": '',
    "description": '',
    "role": '',
    "profilePicture": '',
    "chefPromoCodes": '',
    "menuItems": "",
    "extramenuItems": "",
    "promoCodes": '',
    "wallet": 0,
    "rating": 0,
    "address": Address(
      buildingNumber: '',
      city: '',
      flatNumber: '',
      floor: '',
      governorate: '',
      street: '',
    ),
  };

  void continueStep() {
    if (currentStep == 0 && personalFormKey.currentState!.validate()) {
      personalFormKey.currentState!.save();
      setState(() {
        currentStep++;
      });
    } else if (currentStep == 1 && securityFormKey.currentState!.validate()) {
      securityFormKey.currentState!.save();
      setState(() {
        currentStep++;
      });
    }
  }

  void cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void onStepTapped(int step) {
    setState(() {
      currentStep = step;
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
            child: currentStep == 2
                ? BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorModel.message!),
                          ),
                        );
                      } else if (state is RegisterSuccessfullyState) {
                        Navigator.pushNamed(context, "login");
                      }
                    },
                    builder: (context, state) {
                      return (state is LoginAuthState)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              color: wajbah_primary,
                              text: "Finish",
                              onPressed: _register,
                            );
                    },
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: wajbah_primary,
                      shadowColor: wajbah_black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: details.onStepContinue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Text(
                            currentStep == 2 ? 'Finish' : 'Next',
                            style: Styles.titleMedium
                                .copyWith(color: wajbah_white, fontSize: 18),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
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
              const SizedBox(height: 15),
              CustomAppBar(
                title: "Register",
                showBackButton: false,
              ),
              Expanded(
                flex: 9,
                child: Stepper(
                  elevation: 0,
                  controlsBuilder: (context, details) =>
                      controlBuilders(context, details),
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
                                SizedBox(height: height * 0.05),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: firstnameController,
                                        hintText: "First name",
                                        onSaved: (value) => {
                                          setState(() {
                                            userData['chefFirstName'] = value;
                                          })
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: lastnameController,
                                        hintText: "Last name",
                                        onSaved: (value) => {
                                          setState(() {
                                            userData['chefLastName'] = value;
                                          })
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: height * 0.02),
                                GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: AbsorbPointer(
                                    child: CustomTextField(
                                      usernameController: _birthdateController,
                                      hintText: "Birthdate",
                                      onSaved: (value) => {
                                        setState(() {
                                          userData['birthDate'] = value;
                                        })
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                CustomTextField(
                                  usernameController: nationalIdController,
                                  hintText: "National ID",
                                  onSaved: (value) => {
                                    setState(() {
                                      userData['chefId'] = value;
                                    })
                                  },
                                ),
                                SizedBox(height: height * 0.02),
                                CustomTextField(
                                  usernameController: governerateController,
                                  hintText: "Governrate",
                                  onSaved: (value) => {
                                    setState(() {
                                      userData['address'].governorate = value;
                                      userData['profilePicture'] = 'String';
                                    })
                                  },
                                ),
                                SizedBox(height: height * 0.02),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: cityController,
                                        hintText: "City",
                                        onSaved: (value) => {
                                          setState(() {
                                            userData['address'].city = value;
                                          })
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: streetController,
                                        hintText: "Street",
                                        onSaved: (value) => {
                                          setState(() {
                                            userData['address'].street = value;
                                          })
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: height * 0.02),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: buildingController,
                                        hintText: "Building no.",
                                        onSaved: (value) => {
                                          setState(() {
                                            userData['address'].buildingNumber =
                                                value;
                                          })
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: floorController,
                                        hintText: "Floor no.",
                                        onSaved: (value) => {
                                          setState(() {
                                            userData['address'].floor = value;
                                          })
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Expanded(
                                      child: CustomTextField(
                                        usernameController: flatController,
                                        hintText: "Flat no.",
                                        onSaved: (value) => {
                                          setState(() {
                                            userData['address'].flatNumber =
                                                value;
                                          })
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.08)
                              ],
                            ),
                          ),
                        ),
                      ),
                      stepStyle: const StepStyle(
                          color: wajbah_primary,
                          connectorColor: wajbah_gray,
                          errorColor: Colors.red),
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
                                SizedBox(height: height * 0.05),
                                CustomTextField(
                                  usernameController: emailController,
                                  hintText: "Email",
                                  onSaved: (value) => {
                                    setState(() {
                                      userData['email'] = value;
                                    })
                                  },
                                ),
                                SizedBox(height: height * 0.02),
                                CustomTextField(
                                  usernameController: phoneNumberController,
                                  hintText: "Phone number",
                                  onSaved: (value) => {
                                    setState(() {
                                      userData['phoneNumber'] =
                                          int.parse(value!);
                                    })
                                  },
                                ),
                                SizedBox(height: height * 0.02),
                                PasswordTextField(
                                  passwordController: passwordController,
                                  hidePassword: true,
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  hintText: "Password",
                                  onSaved: (value) => {
                                    setState(() {
                                      userData['password'] = value;
                                    })
                                  },
                                ),
                                SizedBox(height: height * 0.01),
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
                                SizedBox(height: height * 0.01),
                                /*CustomTextField(
                                  usernameController: bankAccountController,
                                  hintText: "Bank account",
                                ),*/
                                SizedBox(height: height * 0.1),
                              ],
                            ),
                          ),
                        ),
                      ),
                      stepStyle: StepStyle(
                          color: currentStep >= 1 ? wajbah_primary: wajbah_gray,
                          connectorColor: wajbah_gray,
                          errorColor: Colors.red),
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
                                          color: Colors.grey[200],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: _profileImage != null
                                              ? Image.file(_profileImage!,
                                                  fit: BoxFit.cover)
                                              : Image.asset(
                                                  "assets/images/authentication/chef_image.png"),
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
                                                        SizedBox(
                                                            height:
                                                                defaultPadding),
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
                                            child: const Icon(Icons.camera_alt,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * 0.05),
                                CustomTextField(
                                  usernameController: kitchenController,
                                  hintText: "Kitchen name",
                                  onSaved: (value) => {
                                    setState(() {
                                      userData['restaurantName'] = value;
                                    })
                                  },
                                ),
                                SizedBox(height: height * 0.02),
                                CustomTextField(
                                  usernameController: descriptionController,
                                  hintText: "Description",
                                  onSaved: (value) => {
                                    setState(() {
                                      userData['description'] = value;
                                    })
                                  },
                                ),
                                SizedBox(height: height * 0.05),
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
                                        style: TextStyle(fontSize: fontSize),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.097),
                              ],
                            ),
                          ),
                        ),
                      ),
                      stepStyle: StepStyle(
                          color: currentStep == 2 ? wajbah_primary: wajbah_gray,
                          connectorColor: wajbah_gray,
                          errorColor: Colors.red),
                      isActive: currentStep >= 0,
                      state: currentStep >= 3
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
                    style: TextStyle(color: Colors.grey, fontSize: fontSize),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: fontSize),
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
