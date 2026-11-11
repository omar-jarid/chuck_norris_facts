import 'package:chuck_norris_facts/presentation/providers/categories/categories_provider.dart';
import 'package:chuck_norris_facts/presentation/utils/context_extensions.dart';
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
  Widget build(BuildContext context, WidgetRef ref) =>
    ref.watch(categoriesProvider).when(
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text(context.l10n.couldNotLoadCategories(error)),
      data: (categories) => categories.isEmpty
        ? const SizedBox() : Padding(
          padding: .symmetric(horizontal: context.dimens.size16),
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: .circular(context.dimens.cardRadius)
              ),
              labelText: context.l10n.selectCategory
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCategory,
                isExpanded: true,
                onChanged: onChanged,
                items: [
                  DropdownMenuItem<String>(
                    value: context.l10n.none,
                    child: Text(context.l10n.none),
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
