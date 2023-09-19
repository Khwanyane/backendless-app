import 'package:asignment_2/views/pages/home_page.dart';
import 'package:asignment_2/views/pages/loading.dart';
import 'package:asignment_2/views/pages/login.dart';
import 'package:asignment_2/views/pages/register.dart';
import 'package:asignment_2/views/pages/reset_password.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String registerPage = '/';
  static const String loginPage = '/loginPage';
  static const String loadingPage = '/loadingPage';
  static const String unitCreatePage = '/unitCreatePage';
  static const String homePage = '/homePage';
  static const String unitViewPage = '/unitViewPage';
  static const String resetPassword = '/resetPassword';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case registerPage:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case loadingPage:
        return MaterialPageRoute(
          builder: (context) => const Loading(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPassword(),
        );
      default:
        throw const FormatException('Route not found');
    }
  }
}
