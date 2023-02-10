import 'package:fever/view/home/home_page.dart';
import 'package:fever/view/splash/splash_page.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => const SplashPage(),
    transition: Transition.circularReveal,
    transitionDuration: const Duration(seconds: 2),
  ),
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    transition: Transition.circularReveal,
    transitionDuration: const Duration(seconds: 2),
  ),
];
