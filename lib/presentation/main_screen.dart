import 'package:chuck_norris_facts/presentation/providers/random_joke/random_joke_provider.dart';
import 'package:chuck_norris_facts/presentation/utils/context_extensions.dart';
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
    _selectedCategory = context.l10n.none;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.appName)),
    body: Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Padding(
            padding: .all(context.dimens.defaultPadding),
            child: CategoryDropdown(
              selectedCategory: _selectedCategory,
              onChanged: (value) => setState(
                () => _selectedCategory = value ?? context.l10n.none
              )
            ),
          ),
          SizedBox(height: context.dimens.size16),
          Expanded(
            child: JokeDisplaySection(selectedCategory: _selectedCategory)
          ),
          Padding(
            padding: .all(context.dimens.defaultPadding),
            child: SizedBox(
              width: .infinity,
              child: ElevatedButton(
                onPressed: () => ref.read(randomJokeProvider.notifier).load(
                  category: _selectedCategory == context.l10n.none
                    ? null : _selectedCategory
                ),
                child: Text(context.l10n.buttonText),
              ),
            ),
          ),
        ]
      )
    )
  );
}