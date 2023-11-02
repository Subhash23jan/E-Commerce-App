import 'dart:convert';

import 'package:amazon_clone_flutter/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle(
    {required http.Response res,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(jsonDecode(res.body)['msg'], context);
      break;
    case 404:
      showSnackBar(jsonDecode(res.body)['msg'], context);
      break;
    case 500:
      showSnackBar(jsonDecode(res.body)['msg']??"error occurred", context);
      break;
    default:
      showSnackBar(jsonDecode(res.body.toString()), context);
  }
}
