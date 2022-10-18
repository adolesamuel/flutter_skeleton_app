import 'package:flutter/material.dart';
import 'package:skels/routes.dart';

class LogInScreen extends StatelessWidget {
  static const route = ScreenPaths.loginScreen;
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Empty')),
    );
  }
}
