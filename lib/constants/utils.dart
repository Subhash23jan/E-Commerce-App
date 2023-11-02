import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(String text, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),
    duration: const Duration(milliseconds: 1500),
    backgroundColor: Colors.black,
    showCloseIcon: true,closeIconColor: Colors.white,));
}
