import 'package:first_app/core/app_colors.dart';
import 'package:first_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          title: Text('Indice de Masa Corporal'),
        ),
        backgroundColor: AppColors.background,
        body: HomeScreen(),
      ),
    );
  }
}
