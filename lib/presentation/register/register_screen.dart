import 'package:flutter/material.dart';
import 'package:marathon/controller/cach_helper.dart';
import 'package:marathon/presentation/Widgets/custom_text_form_field.dart';
import 'package:marathon/presentation/Widgets/custom_text_form_field_pass.dart';
import 'package:marathon/presentation/Widgets/navigator.dart';
import 'package:marathon/presentation/login/login_screen.dart';
import 'package:marathon/presentation/main/home_layout.dart';
import 'package:marathon/presentation/resources/color_manager.dart';
import 'package:marathon/presentation/resources/constants_manager.dart';
import 'package:marathon/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../controller/app_provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var linkedInController = TextEditingController();

  //var imageUrlController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: .3 * media.height,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/mbg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: .02 * media.height,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormFields(
                          controller: nameController,
                          myLabelText: 'Name',
                          status: TextInputAction.next,
                          type: TextInputType.text,
                          prefixIcon: Icons.person,
                          validate: (value) {
                            if (value!.trim().isEmpty) {
                              return "PLease, Enter Your name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        CustomTextFormFields(
                          controller: emailController,
                          myLabelText: 'Email',
                          status: TextInputAction.next,
                          type: TextInputType.emailAddress,
                          prefixIcon: Icons.email_rounded,
                          validate: (value) {
                            if (value!.trim().isEmpty) {
                              return "PLease, Enter Your Email";
                            } else if (value.contains(RegExp(
                                '^[\u0621-\u064A\u0660-\u0669 ]+\$',
                                unicode: true))) {
                              return "Password must be not arabic";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        CustomTextFormFieldsPass(
                          controller: passwordController,
                          myLabelText: 'Password',
                          status: TextInputAction.done,
                          type: TextInputType.emailAddress,
                          prefixIcon: Icons.password_rounded,
                          canObscure: true,
                          validate: (value) {
                            if (value!.trim().isEmpty) {
                              return "PLease, Enter Your Password";
                            } else if (value.contains(' ')) {
                              return "PLease, Enter a Valid Password";
                            } else if (value.length < 9) {
                              return "Password must be more than 8";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        CustomTextFormFieldsPass(
                          controller: confirmPasswordController,
                          myLabelText: 'Confirm Password',
                          status: TextInputAction.done,
                          type: TextInputType.emailAddress,
                          prefixIcon: Icons.password_rounded,
                          canObscure: true,
                          validate: (value) {
                            if (value!.trim().isEmpty) {
                              return "PLease, Enter Your Password";
                            } else if (value.contains(' ')) {
                              return "PLease, Enter a Valid Password";
                            } else if (value.length < 9) {
                              return "Password must be more than 8";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        CustomTextFormFields(
                          controller: phoneController,
                          myLabelText: 'Phone Number',
                          status: TextInputAction.next,
                          type: TextInputType.phone,
                          prefixIcon: Icons.phone,
                          validate: (value) {
                            if (value!.trim().isEmpty) {
                              return "PLease, Enter Your Phone";
                            } else if (value.length < 11) {
                              return "Please enter a valid phone number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        CustomTextFormFields(
                          controller: linkedInController,
                          myLabelText: 'LinkedIn',
                          status: TextInputAction.next,
                          type: TextInputType.emailAddress,
                          prefixIcon: Icons.email_rounded,
                          validate: (value) {
                            if (value!.trim().isEmpty) {
                              return "PLease, Enter Your LinkedIn";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        SizedBox(
                          width: .84 * media.width,
                          height: .06 * media.height,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                value.userRegister(
                                  userName: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                  phone: phoneController.text,
                                  linkedIn: linkedInController.text,
                                );

                                if (formKey.currentState!.validate() &&
                                    value.model!.status == 'ok') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('${value.model!.message}')));

                                  value.getBackendUsers();
                                } else if (value.model!.status == 'false') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('${value.model!.message}')));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('${value.model!.message}')));
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                              value.getUser();
                              CacheHelper.put(
                                      key: 'token', value: value.model!.token)
                                  .then((e) {
                                AppConstants.token = value.model!.token;
                                print(e.toString());
                                navigatorAndRemove(context, const Home());
                              });
                            },
                            child: Text(
                              'REGISTER',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: ColorManager.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: TextButton(
                    child: Text(
                      'I have an account ... ',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    onPressed: () {
                      navigatorAndRemove(context, LoginScreen());
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
