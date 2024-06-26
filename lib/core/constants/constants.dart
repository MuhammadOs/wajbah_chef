import 'dart:async';

import 'package:flutter/material.dart';

const wajbah_primary = Color(0xff4E68FB);
const wajbah_black = Color(0xff2C3E50);
const wajbah_gray = Color(0xff9D9D9D);
const wajbah_buttons = Color(0xffEBF3FF);
const wajbah_green = Color(0xff2DCF6B);
const wajbah_green_light = Color(0xffE1FFE6);
const wajbah_white = Color(0xffffffff);
const wajbah_gray_light = Color(0xffF6F6F6);
const wajbah_yellow = Color(0xffF6CF00);

class RegularExpressions {
  static final RegExp emailRegExp =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])' // At least one lowercase letter
    r'(?=.*[A-Z])' // At least one uppercase letter
    r'(?=.*\d)' // At least one digit
    r'(?=.*[\W_])' // At least one special character (symbol)
    r'.{8,}', // Minimum length of 8 characters
  );
}

class AppConstants {
  static const appName = "Wajbah";
  static const appNameLower = "wajbah";

  // shared preference keys
  static const tokenKey = "token";
  static const timelineKey = "timeline";

  // end points
  static const baseUrl = "https://wajbah-api.azurewebsites.net/api/";
  static const registerUrl = "/UserChefAuth/register";
  static const loginUrl = "/UserChefAuth/login";
  static const logOutUrl = "/logout";
  static const ActiveSwitch = "/Chef/ActiveSwitch";
  static const chefRequests = "/OrderAPI/GetOrdersRequests";
  static const menuItems = "/MenuItemAPI/GetMenuItemsByChefId";
  static const postMenuItem = "/MenuItemAPI";
  static const updateState = "/OrderAPI/ChangeOrderState";
  static const trackOrders = "/OrderAPI/GetChefOrders";
  static const updateProfile = "Chef";

  // Cache control headers
  static const noCacheHeaders = {
    'Cache-Control': 'no-cache',
    'Pragma': 'no-cache',
  };
}


class TimerService {
  Timer? _timer;
  late Duration _duration;
  Function(Duration)? _listener;

  void start(Duration duration, Function(Duration) listener) {
    _duration = duration;
    _listener = listener;

    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    if (_duration.inSeconds > 0) {
      _duration = _duration - Duration(seconds: 1);
      if (_listener != null) {
        _listener!(_duration);
      }
    } else {
      _timer?.cancel();
    }
  }

  void cancelTimer() {
    _timer?.cancel();
  }
}

/*
class TimerService {
  late Timer _timer;
  late Duration _duration;

  Function(Duration)? _listener;

  void start(Duration duration, Function(Duration) listener) {
    _duration = duration;
    _listener = listener;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    if (_duration.inSeconds > 0) {
      _duration = _duration - Duration(seconds: 1);
      _listener!(_duration);
    } else {
      _timer.cancel();
    }
  }

  void cancelTimer() {
    _timer.cancel();
  }
}*/
