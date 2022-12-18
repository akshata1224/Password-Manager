import 'package:flutter/material.dart';

import 'package:pm/presentation/screens/addpass_screen.dart';
import 'package:pm/presentation/screens/home_screen.dart';
import 'package:pm/presentation/screens/login_screen.dart';
import 'package:pm/presentation/screens/signup_screen.dart';
import 'package:pm/presentation/screens/splash_screen.dart';
import 'package:pm/presentation/screens/trash_screen.dart';


Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case '/trash':
      return MaterialPageRoute(builder: (_) => const TrashScreen());
    case '/addPass':
      return MaterialPageRoute(builder: (_) => const AddPassScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/signup':
      return MaterialPageRoute(builder: (_) => const SignupScreen());
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
