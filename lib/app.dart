import 'package:calculator/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'calculator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      title: 'Batch-13',
      home: Calculator(),
      initialRoute: 'Calculator',
      routes: {
        'Calculator': (context) => Calculator(),
      },
    );
  }
}