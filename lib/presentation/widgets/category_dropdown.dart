import 'package:chuck_norris_facts/generated/app_localizations.dart';
import 'package:chuck_norris_facts/presentation/providers/categories_provider.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDropdown extends ConsumerWidget {
  final String selectedCategory;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimens = Dimens.getAppDimens(context);
    final localization = AppLocalizations.of(context)!;

    return ref.watch(categoriesProvider).when(
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text('Could not load categories: $error'),
      data: (categories) => categories.isEmpty
        ? const SizedBox() : Padding(
          padding: EdgeInsets.symmetric(horizontal: dimens.size16),
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(dimens.cardRadius)
              ),
              labelText: localization.selectCategory
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCategory,
                isExpanded: true,
                onChanged: onChanged,
                items: [
                  DropdownMenuItem<String>(
                    value: localization.none,
                    child: Text(localization.none),
                  ),
                  ...categories.map(
                    (category) => DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    )
                  )],
              ),
            ),
         ),
        ),
    );
  }
}
