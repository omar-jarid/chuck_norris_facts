import 'package:chuck_norris_facts/di/main_module.dart';
import 'package:chuck_norris_facts/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

void main() {
  MainModule().initialize(Injector());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}