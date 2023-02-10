import 'package:fever/controller/splash/splash_controller.dart';
import 'package:fever/model/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    FColors.blue1,
                    Colors.white,
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          );
        });
  }
}
