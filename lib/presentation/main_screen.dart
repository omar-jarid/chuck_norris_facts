import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_categories/load_categories_cubit.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_random_joke/load_random_joke_cubit.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:chuck_norris_facts/presentation/widgets/joke_card.dart';
import 'package:fimber_io/fimber_io.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocBuilder<LoadCategoriesCubit, List<String>>(
              builder: (context, categories) => categories.isEmpty
                ? const SizedBox() : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.getAppDimens(context).size16
                  ),
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem<String>(
                        value: AppLocalizations.of(context)!.none,
                        child: Text(AppLocalizations.of(context)!.none),
                      ),
                      ...categories.map(
                      (category) => DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      )
                    )],
                    onChanged: (value) => setState(
                      () => _selectedCategory =
                        value ?? AppLocalizations.of(context)!.none
                    )
                  ),
                ),
            ),

            SizedBox(height: Dimens.getAppDimens(context).size16),

            BlocConsumer<LoadRandomJokeCubit, LoadRandomJokeCubitState>(
              listener: (context, state) {
                if (state is LoadRandomJokeCubitError) {
                  Fimber.e(state.error.toString());
                }
              },
              builder: (context, state) {
                if (state is LoadRandomJokeCubitInitial) {
                  return const _InitialLayout();
                } else if (state is LoadRandomJokeCubitLoading) {
                  return const _LoadingLayout();
                } else if (state is LoadRandomJokeCubitSuccess) {
                  return _SuccessLayout(state.result);
                }

                return Container();
              }
            ),
            ElevatedButton(
              onPressed: () => context.read<LoadRandomJokeCubit>()
                .getRandomJoke(_selectedCategory),
              child: Text(AppLocalizations.of(context)!.buttonText)
            )
          ],
        ),
      ),
    );
  }
}

class _LoadingLayout extends StatelessWidget {
  const _LoadingLayout();

  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator()
  );
}

class _SuccessLayout extends StatelessWidget {
  final JokeModel joke;

  const _SuccessLayout(this.joke);

  @override
  Widget build(BuildContext context) => JokeCard(joke);
}

class _InitialLayout extends StatelessWidget {
  const _InitialLayout();

  @override
  Widget build(BuildContext context) => Container();
}