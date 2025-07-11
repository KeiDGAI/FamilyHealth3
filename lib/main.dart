import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'auth/login_page.dart';
import 'auth/register_page.dart';
import 'family/family_dashboard_page.dart';
import 'family/family_create_page.dart';
import 'health/health_dashboard_page.dart';
import 'firebase_options.dart'; // flutterfire configureで自動生成

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FamilyHealthApp());
}

class FamilyHealthApp extends StatelessWidget {
  const FamilyHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '家族健康アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/family': (context) => const FamilyDashboardPage(),
        '/family_create': (context) => const FamilyCreatePage(),
        '/health': (context) => const HealthDashboardPage(),
      },
    );
  }
}
