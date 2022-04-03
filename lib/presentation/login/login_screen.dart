import 'package:flutter/material.dart';
import 'package:marathon/controller/cach_helper.dart';
import 'package:marathon/presentation/Widgets/custom_text_form_field.dart';
import 'package:marathon/presentation/Widgets/custom_text_form_field_pass.dart';
import 'package:marathon/presentation/Widgets/navigator.dart';
import 'package:marathon/presentation/register/register_screen.dart';
import 'package:marathon/presentation/resources/color_manager.dart';
import 'package:marathon/presentation/resources/constants_manager.dart';
import 'package:marathon/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../controller/app_provider.dart';
import '../main/home_layout.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final focus = FocusNode();

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
                            } else if (value.length < 8) {
                              return "Password must be more than 8";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: media.height / 40,
                        ),
                        SizedBox(
                          width: .84 * media.width,
                          height: .06 * media.height,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await value.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);

                                if (formKey.currentState!.validate() &&
                                    formKey.currentState != null &&
                                    value.model!.status == 'ok') {
                                  CacheHelper.put(
                                      key: 'token', value: value.model!.token)
                                      .then((e) {
                                    AppConstants.token = e.toString();
                                    print(AppConstants.token);
                                    print(e.toString());

                                  });
                                  await value.getUser();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('${value.model!.status}')));
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

                              navigatorAndRemove(context, const Home());
                            },
                            child: Text(
                              'LOGIN',
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
                    navigatorAndRemove(context, RegisterScreen());
                  },
                  child: Text(
                    'it is my first time ... ',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
