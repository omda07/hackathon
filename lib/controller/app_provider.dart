import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marathon/model/algorithm_model.dart';
import 'package:marathon/model/backend_user.dart';
import 'package:marathon/model/mathematics_model.dart';
import 'package:marathon/presentation/main/home_screen.dart';
import 'package:marathon/presentation/main/news_screen.dart';
import 'package:marathon/presentation/main/settings_screen.dart';
import 'package:marathon/presentation/resources/constants_manager.dart';

import '../end_points.dart';
import '../model/user_model.dart';
import 'http_helper.dart';

class AppProvider with ChangeNotifier {
  int currentIndex = 0;
  DateTime selectedDate = DateTime.now();
  DateTime chosenDate = DateTime.now();

  List<Widget> screens = [
    const HomeScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];
  List<String> title = ['Home', 'News', 'Settings'];

  void changeBottomNav(int index) {
    if(index == 0){
      getBackendUsers();
    }else if(index == 1){
      getMathematicsUsers();
    }
    else if(index == 2){
      getAlgorithmModelUsers();
    }
    currentIndex = index;
    print(currentIndex);
    notifyListeners();
  }

  void changeSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void changeChosenDate(DateTime date) {
    chosenDate = date;
    notifyListeners();
  }

  UserModel? model;

  bool eye = true;
  bool confirmEye = true;

  int loginStatus = 0;

  // password Visible;
  bool visiblePassword = true;

  changeVisible() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }

  Future userLogin({required String email, required String password}) async {
    await HttpHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      var mJson = json.decode(value.body);
      model = UserModel.fromJson(mJson);
      print("$mJson");
      print("${model!.token}");
      getUser();
      notifyListeners();
    }).catchError((onError) {
      print(onError.toString());
      notifyListeners();
    });
    //notifyListeners();
  }

  Future userRegister(
      {required String email,
      required String password,
      required String confirmPassword,
      required String userName,
      required String phone,
      required String linkedIn}) async {
    await HttpHelper.postData(url: REGISTER, data: {
      'userName': userName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phone': phone,
      'linkedIn': linkedIn,
    }).then((value) {
      var mJson = json.decode(value.body);
      model = UserModel.fromJson(mJson);
      print("$mJson");
      print("${model!.message}");
      getUser();
      notifyListeners();
    }).catchError((onError) {
      print(onError.toString());
      notifyListeners();
    });
    notifyListeners();
  }

  BackendUserModel? backendUserModel;

  Future getBackendUsers() async {
    await HttpHelper.getData(
      url: backend,
    ).then((value) {
      var mJson = json.decode(value.body);
      backendUserModel = BackendUserModel.fromJson(mJson);
      // for (var element in backendUserModel!.users!) {
      //
      //   backendUsers.addAll(element);
      // }
      print(backendUserModel!.users![0].userName);
      notifyListeners();
    }).catchError((error) {
      notifyListeners();
    });
    notifyListeners();
  }

  MathematicsModel? mathematicsModel;

  Future getMathematicsUsers() async {
    await HttpHelper.getData(
      url: mathematics,
    ).then((value) {
      var mJson = json.decode(value.body);
      mathematicsModel = MathematicsModel.fromJson(mJson);
      // for (var element in backendUserModel!.users!) {
      //
      //   backendUsers.addAll(element);
      // }
      print(mathematicsModel!.users![0].userName);
      notifyListeners();
    }).catchError((error) {
      notifyListeners();
    });
    notifyListeners();
  }

  AlgorithmModel? algorithmModel;

  Future getAlgorithmModelUsers() async {
    await HttpHelper.getData(
      url: algorithm,
    ).then((value) {
      var mJson = json.decode(value.body);
      algorithmModel = AlgorithmModel.fromJson(mJson);
      // for (var element in backendUserModel!.users!) {
      //
      //   backendUsers.addAll(element);
      // }
      print(algorithmModel!.users![0].userName);
      notifyListeners();
    }).catchError((error) {
      notifyListeners();
    });
    notifyListeners();
  }

  Future getUser() async {
    await HttpHelper.getData(
      token: AppConstants.token,
      url: profile,
    ).then((value) {
      print(AppConstants.token);
      var mJson = json.decode(value.body);
      model = UserModel.fromJson(mJson);
      // for (var element in backendUserModel!.users!) {
      //
      //   backendUsers.addAll(element);
      // }
      print(model!.profile!.email);
      notifyListeners();
    }).catchError((error) {
      notifyListeners();
    });
    notifyListeners();
  }

  Future updateScore() async {
    await HttpHelper.putData(
      token: AppConstants.token,
      url: score,
    ).then((value) {
      print(AppConstants.token);
      // var mJson = json.decode(value.body);
      // model = UserModel.fromJson(mJson);
      // for (var element in backendUserModel!.users!) {
      //
      //   backendUsers.addAll(element);
      // }
      print(model!.profile!.score);
      notifyListeners();
    }).catchError((error) {
      notifyListeners();
    });
    notifyListeners();
  }

  //page Animation
  bool tabIsOpend = true;

  openTab() {
    tabIsOpend = !tabIsOpend;
    notifyListeners();
  }

//Chart Animation
  bool chartIsOpend = true;

  OpenChart()  {
    chartIsOpend = !chartIsOpend;
    notifyListeners();
  }
}
