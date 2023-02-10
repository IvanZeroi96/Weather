import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAllNamed('/home');
      },
    );
    super.onReady();
  }
}
