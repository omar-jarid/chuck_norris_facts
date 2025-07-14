import 'package:chuck_norris_facts/presentation/cubit/load_categories/load_categories_cubit.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDropdown extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.getAppDimens(context);
    final localization = AppLocalizations.of(context)!;

    return BlocBuilder<LoadCategoriesCubit, List<String>>(
      builder: (context, categories) => categories.isEmpty
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
              onChanged: onChanged
            ),
          ),
        ),
      ),
    );
  }
}
