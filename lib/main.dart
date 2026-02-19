import 'dart:io';

import 'package:chuck_norris_facts/di/main_module.dart';
import 'package:chuck_norris_facts/generated/app_localizations.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_categories/load_categories_cubit.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_random_joke/load_random_joke_cubit.dart';
import 'package:chuck_norris_facts/presentation/main_screen.dart';
import 'package:chuck_norris_facts/presentation/themes/themes.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:freedroidwarn/freedroidwarn.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  Fimber.plantTree(DebugTree());
  MainModule().initialize(Injector());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<int> getBuildVersion() async => await PackageInfo.fromPlatform().then(
    (value) => int.parse(value.buildNumber)
  );

  @override
  Widget build(BuildContext context) => FutureBuilder<int>(
    future: getBuildVersion(),
    builder: (context, snapshot) {
      if (snapshot.hasData && Platform.isAndroid) {
        FreeDroidWarn.showWarningOnUpgrade(context, snapshot.data!);
      }

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: MultiBlocProvider(
            providers: [
              BlocProvider<LoadRandomJokeCubit>(
                  create: (_) => Injector().get<LoadRandomJokeCubit>()
              ),
              BlocProvider<LoadCategoriesCubit>(
                  create: (_) => Injector().get<LoadCategoriesCubit>()
              ),
            ],
            child: const MainScreen()
        ),
      );
    }
  );
}