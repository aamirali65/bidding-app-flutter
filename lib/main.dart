import 'package:flutter/material.dart';
import 'package:gobidder/routes/routes.dart';
import 'package:gobidder/screens/auth/sign_up.dart';
import 'package:gobidder/screens/splash/splashScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://eqdbhfaquzuurppirmui.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxZGJoZmFxdXp1dXJwcGlybXVpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY4Njc5OTAsImV4cCI6MjA2MjQ0Mzk5MH0.rH-zCVeYH_KVSLLDWXbNUmCFUHge4d1JpfYgxzywT-g',
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/', // Splashscreen will redirect accordingly
    );
  }
}
