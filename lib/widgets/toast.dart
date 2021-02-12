import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Toasts {
  static void showToast(String content) {
    Fluttertoast.showToast(
        msg: content,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
