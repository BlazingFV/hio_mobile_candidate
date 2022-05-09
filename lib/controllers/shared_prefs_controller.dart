import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsController extends GetxController {
  SharedPreferences? sharedPreferences;
  String? token;
  String? fcmToken;
  int? userId;
  String? userRole;
  @override
  void onInit() async {
    await initSharedPrefs();
    await getUserId();
    // await getFCMToken();
    await setFCMToken();
    await getUserRole();
    // await getToken();

    super.onInit();
  }

  initSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    log('<====SharedPrefsController====>initalized Successfully<==== SharedPrefsController====> ');
  }

  setToken(String token) async {
    await initSharedPrefs();
    await sharedPreferences?.setString('token', token);
    update();
    getToken();
  }

  setUserRole(String role) async {
    await initSharedPrefs();
    await sharedPreferences?.setString('role', role);
    update();
    getUserRole();
  }

  getUserRole() async {
    await initSharedPrefs();
    userRole = sharedPreferences?.getString('role');
    log('$userRole========UserRole===========');
    update();
    return userRole;
  }

  getToken() async {
    await initSharedPrefs();
    token = sharedPreferences?.getString('token');
    log('$token========Token');
    return token;
  }

  getFCMToken() async {
    await initSharedPrefs();
    fcmToken = sharedPreferences?.getString('fcmToken');
    log('$fcmToken========fcmToken sharedd');
    update();
    return fcmToken;
  }

  setFCMToken() async {
    await initSharedPrefs();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    await sharedPreferences?.setString('fcmToken', fcmToken!);
    update();
    await getFCMToken();
  }

  setUserId(int id) async {
    await initSharedPrefs();
    await sharedPreferences?.setInt('userId', id);
    update();
    getUserId();
  }

  getUserId() async {
    await initSharedPrefs();
    userId = sharedPreferences?.getInt('userId');
    log('$userId========UserID===========');
    update();
    return userId;
  }
}