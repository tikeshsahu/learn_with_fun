import 'package:get/get.dart';
import 'package:learn_with_fun/controllers/network_connectivity_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
