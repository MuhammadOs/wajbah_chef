import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_model.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/login_view/widgets/forget_password_widget.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/login_view/widgets/google_container.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/login_view/widgets/login_register_navigator_row.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/login_view/widgets/remember_me_row.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/widgets/custom_button.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/widgets/custom_text_field.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/widgets/password_text_field.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_cubit.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_states.dart';
import 'package:wajbah_chef/features/Home/presentation/view/home_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, dynamic> userData = {
    'phoneNumber': '',
    'password': '',
  };
  bool hidePassword = true;
  bool rememberMe = false;

  signIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    getAuthCubit(context).login(LoginModel.fromJson(userData));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Login", style: Styles.titleMedium),
                  ),
                  const SizedBox(height: 40.0),
                  CustomTextField(
                    usernameController: usernameController,
                    hintText: "Phone number",
                    isNumbers: true,
                    onSaved: (value) {
                      userData["phoneNumber"] = int.parse(value!);
                    },
                  ),
                  const SizedBox(height: 25.0),
                  PasswordTextField(
                    passwordController: passwordController,
                    hintText: "Password",
                    hidePassword: hidePassword,
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    onSaved: (value) {
                      userData["password"] = value!;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RememberMeRow(
                        rememberMe: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = !rememberMe;
                          });
                        },
                      ),
                      const ForgetPasswordWidget(),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  const Center(
                    child: Text('Or', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 10.0),
                  const GoogleIconContainer(),
                  const SizedBox(height: 15),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorModel.message!)),
                        );
                      } else if (state is LoginSuccessfullyState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreenView(),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return (state is LoginAuthState)
                          ? const Center(child: CircularProgressIndicator.adaptive())
                          : Center(
                              child: SizedBox(
                                width: width * 0.8,
                                height: 60,
                                child: CustomButton(
                                  color: Colors.blue,
                                  text: "Login",
                                  onPressed: signIn,
                                ),
                              ),
                            );
                    },
                  ),
                  const SizedBox(height: 15),
                  const LoginRegisterNavigatorRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
