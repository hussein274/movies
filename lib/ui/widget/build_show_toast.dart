import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void buildShowToast(String msg,Color color) {
      Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor:color,
      textColor: Colors.black,
      fontSize: 16.0
  );
}