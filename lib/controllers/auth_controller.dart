import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as client;
import 'package:hio_mobile_candidate/controllers/shared_prefs_controller.dart';
import 'package:hio_mobile_candidate/controllers/snack_bar_controller.dart';
import 'package:hio_mobile_candidate/models/authentication_model.dart';

import '../configs/app_configs.dart';
import '../shared/widgets/shared_loading_dialog.dart';

class AuthController extends GetxController {
  final SharedPrefsController _sharedPrefsController = SharedPrefsController();
  AuthenticationObject authenticationObject = AuthenticationObject();
  final dio = client.Dio(client.BaseOptions(
    connectTimeout: 30000000,
    receiveTimeout: 5000,
    baseUrl: AppConfigs.apiBaseUrl,
    followRedirects: false,
    validateStatus: (status) => true,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  loginUsingEmail(String email, String password, BuildContext context) async {
    var dio = client.Dio();
    String errMessage = '';

    try {
      showLoaderDialog(context, 'Authenticating ....');

      Map<String, dynamic> body = {
        'email': email,
        'password': password,
      };
      var options = client.BaseOptions(baseUrl: AppConfigs.apiBaseUrl);
      dio = client.Dio(options);
      client.Response response = await dio.request('users/auth/login/',
          data: body,
          options: client.Options(
            method: 'POST',
            followRedirects: false,
            validateStatus: (status) => true,
          ));

      if (response.statusCode == 200) {
        log('===Login Response=======${response.data['key']}===Login Response=======');

        await _sharedPrefsController.setToken(response.data['key']);
        await getUserData();

        await Future.delayed(const Duration(milliseconds: 1500), () {
          Get.back(canPop: true, closeOverlays: true);
        });

        update();
      } else {
        await Future.delayed(const Duration(milliseconds: 1500), () {
          Get.back(canPop: true, closeOverlays: true);
        });

        log('${response} ======================Error Authenticating=====================');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  getUserData() async {
    try {
      await _sharedPrefsController.getToken();
      client.Response response = await dio.request(
        'candidates/me/',
        options: client.Options(
          method: 'GET',
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Token ${_sharedPrefsController.token}',
          },
        ),
      );
      if (response.statusCode == 200) {
        log('===Login Response=======${response.data}===Login Response=======');
        authenticationObject = AuthenticationObject.fromMap(response.data);
        log('===Login Response=======${authenticationObject.user?.name}===Login Name=======');
        _sharedPrefsController.setUserId(authenticationObject.id!);

        SnackBarService.instance.showSnackBarSuccess(
          'Successfully Logged In',
        );

        update();
      } else {
        await Future.delayed(const Duration(milliseconds: 1500), () {
          Get.back(canPop: true, closeOverlays: true);
        });

        log('${response} ======================Error Authenticating=====================');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

showLoaderDialog(BuildContext context, title) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return SharedLoadingDialog(
        title: title,
      );
    },
  );
}
