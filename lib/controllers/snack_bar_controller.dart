import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/app_configs.dart';


class SnackBarService {
  BuildContext? _buildContext;

  static SnackBarService instance = SnackBarService();

  SnackBarService();

  set buildContext(BuildContext _context) {
    _buildContext = _context;
  }

  void showSnackBarError(String _message) {
    Get.snackbar(
      '',
      '',
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      duration: const Duration(seconds: 5),
      titleText: Text(
        'Alert!',
        style: AppConfigs.appBarTitle.copyWith(fontSize: 15),
      ),
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      messageText: Text(
        _message,
        style: AppConfigs.appBarTitle.copyWith(fontSize: 15)
      ),
      snackPosition: SnackPosition.TOP,
        // snackStyle: SnackStyle.GROUNDED,
      backgroundColor: Colors.red[400],
      shouldIconPulse: true,
    );
  }

  void showSnackBarSuccess(String _message) {
    Get.snackbar(
      '',
      '',
      margin: const EdgeInsets.only(
       top: 10,
        left: 10,
        right: 10,
      ),
      duration: const Duration(seconds: 3),
      titleText:  Text(
        'Success',
        style: AppConfigs.appBarTitle.copyWith(fontSize: 15)
      ),
      messageText: Text(
        _message,
        style: AppConfigs.appBarTitle.copyWith(fontSize: 15),
      ),
      snackPosition: SnackPosition.TOP,
      animationDuration: const Duration(milliseconds: 350),
      // forwardAnimationCurve: Curves.easeIn,
      // reverseAnimationCurve: Curves.easeOutBack,
      backgroundColor: Colors.green[400],
      // snackStyle: SnackStyle.GROUNDED,
    );
  }
}