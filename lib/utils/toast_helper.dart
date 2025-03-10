import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_13/const/color.dart';

class ToastHelper {
  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: green,
      textColor: white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
} 