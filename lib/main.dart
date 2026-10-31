import 'package:chuck_norris_facts/di/main_module.dart';
import 'package:chuck_norris_facts/generated/app_localizations.dart';
import 'package:chuck_norris_facts/presentation/main_screen.dart';
import 'package:chuck_norris_facts/presentation/themes/themes.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
  Fimber.plantTree(DebugTree());
  MainModule().initialize(Injector());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: ThemeMode.system,
    home: const MainScreen()
  );
}