import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:learn_with_fun/widgets/noInternetDialog.dart';
import 'package:flutter/material.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
  }

  _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.dialog(const NoInternetDialog(), barrierDismissible: false).whenComplete(() {
        if (connectivityResult == ConnectivityResult.none) {
          Get.dialog(const NoInternetDialog(), barrierDismissible: false);
        } else {
          if (Get.isDialogOpen!) {
            Navigator.of(Get.context!).pop();
          }
        }
      });
    } else {
      if (Get.isDialogOpen!) {
        Navigator.of(Get.context!).pop();
      }
    }
  }
}
