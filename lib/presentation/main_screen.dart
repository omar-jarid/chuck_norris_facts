import 'package:chuck_norris_facts/generated/app_localizations.dart';
import 'package:chuck_norris_facts/presentation/providers/random_joke/random_joke_provider.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:chuck_norris_facts/presentation/widgets/category_dropdown.dart';
import 'package:chuck_norris_facts/presentation/widgets/joke_display_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late String _selectedCategory;

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
            Padding(
              padding: EdgeInsets.all(dimens.defaultPadding),
              child: CategoryDropdown(
                selectedCategory: _selectedCategory,
                onChanged: (value) => setState(
                  () => _selectedCategory = value ?? localization.none
                )
              ),
            ),
            SizedBox(height: dimens.size16),
            Expanded(
              child: JokeDisplaySection(selectedCategory: _selectedCategory)
            ),
            Padding(
              padding: EdgeInsets.all(dimens.defaultPadding),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => ref.read(randomJokeProvider.notifier).load(
                    category: _selectedCategory == localization.none
                      ? null : _selectedCategory
                  ),
                  child: Text(localization.buttonText),
                ),
              ),
            ),
          ]
        )
      )
    );
  }
}