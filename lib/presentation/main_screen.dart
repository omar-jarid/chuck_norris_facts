import 'package:chuck_norris_facts/presentation/cubit/load_categories/load_categories_cubit.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:chuck_norris_facts/presentation/widgets/category_dropdown.dart';
import 'package:chuck_norris_facts/presentation/widgets/joke_display_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    context.read<LoadCategoriesCubit>().loadCategories();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedCategory = AppLocalizations.of(context)!.none;
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.getAppDimens(context);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localization.appName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryDropdown(
              selectedCategory: _selectedCategory,
              onChanged: (value) => setState(
                () => _selectedCategory = value ?? localization.none
              )
            ),
            SizedBox(height: dimens.size16),
            JokeDisplaySection(selectedCategory: _selectedCategory)
          ]
        )
      )
    );
  }
}