import 'package:app_development_competition/provider/themeProvider.dart';
import 'package:app_development_competition/screens/homepage.dart';
import 'package:app_development_competition/screens/login_screen.dart';
import 'package:app_development_competition/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MaterialApp(
        home: SafeArea(
          child: SignInScreen(),
        ),
      ),
    );
  }
}
