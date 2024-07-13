import 'package:get/get.dart';
import 'package:health_care_ex/src/controllers/auth_controller.dart';

class InitializeController {
  void init() {
    Get.lazyPut(() => AuthController());
  }
}
