import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marathon/presentation/resources/color_manager.dart';
import 'package:marathon/presentation/resources/font_manager.dart';
import 'package:marathon/presentation/resources/routes_manager.dart';

import '../resources/constants_manager.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    print('herrrrrrrr${AppConstants.token}');
    AppConstants.token == null ?
    Navigator.pushReplacementNamed(context, Routes.loginRoute):Navigator.pushReplacementNamed(context, Routes.mainRoute);

  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Orange ',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: ColorManager.black, fontSize: FontSize.s26),
          ),
          Text(
            'Digital Center',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: ColorManager.white, fontSize: FontSize.s24),
          )
        ],
      )),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
