import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as client;
import 'package:hio_mobile_candidate/controllers/shared_prefs_controller.dart';
import 'package:hio_mobile_candidate/controllers/snack_bar_controller.dart';
import 'package:hio_mobile_candidate/models/authentication_model.dart';
import 'package:hio_mobile_candidate/screens/auth/auth_screen.dart';

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

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  registerUser(
    BuildContext context, {
    required String name,
    required String email,
    required String country,
    required String phone,
    required String password,
    required String passwordConfirm,
  }) async {
    var dio = client.Dio();
    String errMessage = '';

    try {
      showLoaderDialog(context, 'Registering you ...');

      Map<String, dynamic> body = {
        "username": name,
        "email": email,
        "password1": password,
        "password2": passwordConfirm,
        "first_name": name,
        "last_name": name,
        "country": country,
        "phone_number": phone
      };
      var options = client.BaseOptions(baseUrl: AppConfigs.apiBaseUrl);
      dio = client.Dio(options);
      client.Response response =
          await dio.request('users/auth/registration/candidate/',
              data: body,
              options: client.Options(
                method: 'POST',
                followRedirects: false,
                validateStatus: (status) => true,
              ));

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('===Login Response=======${response.data['key']}===Login Response=======');
        // log('${response.statusCode} ======================Error Authenticating=====================');

        await Future.delayed(const Duration(milliseconds: 1500), () {
          Get.back(canPop: true, closeOverlays: true);
        });
        SnackBarService.instance.showSnackBarSuccess(
          '${response.data['msg']}',
        );

        await Future.delayed(const Duration(milliseconds: 1500), () {
          Get.off(() => const AuthScreen());
        });
        update();
      } else {
        await Future.delayed(const Duration(milliseconds: 1500), () {
          Get.back(canPop: true, closeOverlays: true);
        });

        log('${response} ======================Error Authenticating=====================');
        log('${response.statusCode} ======================Error Authenticating=====================');
        SnackBarService.instance.showSnackBarError(
          '${response.data}',
        );
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
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('===Login Response=======${response.data}===Login Response=======');
        authenticationObject = AuthenticationObject.fromMap(response.data);
        log('===Login Response=======${authenticationObject.user?.name}===Login Name=======');
        _sharedPrefsController.setUserId(authenticationObject.id!);
        await postDeviceDataAndFCMTokenToBackEnd();
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

  postDeviceDataAndFCMTokenToBackEnd() async {
    try {
      await _sharedPrefsController.getToken();
      await _sharedPrefsController.setFCMToken();
      await _sharedPrefsController.getFCMToken();
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;

      final deviceInfoMap = deviceInfo.toMap();
      log('deviceInfoMap========= $deviceInfoMap');
      log('deviceInfoMap========= ${deviceInfoMap['androidId']}');
      log('deviceInfoMap========= ${deviceInfoMap['brand']}');
      log('deviceInfoMap========= ${_sharedPrefsController.fcmToken}');
      client.FormData body = client.FormData.fromMap({
        "registration_id": _sharedPrefsController.fcmToken,
        "type": Platform.isAndroid ? 'android' : 'ios'
      });
      // var options = client.BaseOptions(baseUrl: AppConfigs.apiBaseUrl);
      // var options = client.BaseOptions(baseUrl: AppConfigs.apiBaseUrl);
      // dio = client.Dio(options);
      client.Response response = await dio.request(
        '/devices/',
        data: body,
        options: client.Options(
          contentType: 'application/json',
          method: 'POST',
          followRedirects: false,
          validateStatus: (status) {
            return status !< 500;
          },
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Token ${_sharedPrefsController.token}',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('===Devices Response=======${response.data}===Devices Response=======');
        // authenticationObject = AuthenticationObject.fromMap(response.data);
        // log('===Devices Response=======${authenticationObject.user?.name}===Devices Name=======');
        // _sharedPrefsController.setUserId(authenticationObject.id!);

        // SnackBarService.instance.showSnackBarSuccess(
        //   'Successfully Logged In',
        // );

        update();
      } else {
        // await Future.delayed(const Duration(milliseconds: 1500), () {
        //   Get.back(canPop: true, closeOverlays: true);
        // });

        // await Future.delayed(const Duration(milliseconds: 1500), () {
        //   Get.back(canPop: true, closeOverlays: true);
        // });

        log('${response.headers} ======================Error Authenticating=====================');
        log('${response.statusCode} ======================Error Authenticating=====================');
        // SnackBarService.instance.showSnackBarError(
        //   '${response.data}',
        // );
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
