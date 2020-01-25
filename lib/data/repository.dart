import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_to_pdf/data/http_client.dart';
import 'package:json_to_pdf/util/nav_util.dart';
import 'package:flushbar/flushbar.dart';
import 'package:dio/dio.dart';

class AppRepository {

  static HttpClient client = HttpClient.instance;

  String getErrorMsg(dynamic e) {
    if (e is DioError) {
      var resData = e.response?.data;
      var errorMessage = resData is Map<String, dynamic> ? resData['error'] :  null;
      if (e.error is SocketException) return "No Internet";
      return errorMessage != null && errorMessage.isNotEmpty ? errorMessage :
      (e.message.isNotEmpty ? e.message : "Something Went Wrong");
    }
    return "Something Went Wrong";
  }

  showErrorSnackbar(BuildContext context, dynamic e, {int seconds = 3, String message}) {
    String errorMsg = message ?? getErrorMsg(e);
    Flushbar(
      messageText: Text(
        errorMsg,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      duration: Duration(seconds: seconds),
      flushbarStyle: FlushbarStyle.GROUNDED,
    )
    ..show(context);
  }

  String path = "/~vivekgt/tmp/resp.json";  // "/api/json"

  getData(BuildContext context) async {
    try {
      NavigationUtil.showBlockingDialog(context);
      print("Getting Data");
      var res = await client.getRequest(path, null);
      print("Got Data");
      NavigationUtil.dismissBlockingDialog(context);
      return res;
    } catch(e) {
      print(e);
      NavigationUtil.dismissBlockingDialog(context);
      return null;
    }
  }
}