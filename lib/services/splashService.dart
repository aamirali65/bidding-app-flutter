import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashService {
  void checkAuthentication(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    // Delay splash screen for a short time
    Timer(const Duration(seconds: 2), () {
      if (user != null) {
        // User is logged in
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // User not logged in
        Navigator.pushReplacementNamed(context, '/signin');
      }
    });
  }
}
