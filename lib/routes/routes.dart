import 'package:flutter/material.dart';
import 'package:gobidder/screens/auth/sign_in.dart';
import 'package:gobidder/screens/auth/sign_up.dart';
import 'package:gobidder/screens/home/home.dart';
import 'package:gobidder/screens/profile/profile_list.dart';
import 'package:gobidder/screens/splash/splashScreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splashscreen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignIn());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
