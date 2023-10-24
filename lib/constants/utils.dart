import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(String text, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),
    duration: const Duration(seconds: 1),backgroundColor: Colors.black,
    showCloseIcon: true,closeIconColor: Colors.white,));
}
