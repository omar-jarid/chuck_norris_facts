import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_categories/load_categories_cubit.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_random_joke/load_random_joke_cubit.dart';
import 'package:chuck_norris_facts/constants/constants.dart';
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
    final dimens = Dimens.getAppDimens(context);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localization.appName),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocBuilder<LoadCategoriesCubit, List<String>>(
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
                        value: _selectedCategory,
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
                        onChanged: (value) => setState(
                          () => _selectedCategory = value ?? localization.none
                        )
                      ),
                    ),
                  ),
                ),
            ),

            SizedBox(height: dimens.size16),

            BlocConsumer<LoadRandomJokeCubit, LoadRandomJokeCubitState>(
              listener: (context, state) {
                if (state is LoadRandomJokeCubitError) {
                  Fimber.e(state.error.toString());
                }
              },
              builder: (context, state) {
                Widget child;

                if (state is LoadRandomJokeCubitInitial) {
                  child =  const _InitialLayout();
                } else if (state is LoadRandomJokeCubitLoading) {
                  child = const _LoadingLayout();
                } else if (state is LoadRandomJokeCubitSuccess) {
                  child = _SuccessLayout(state.result);
                } else { child = Container(); }

                return AnimatedSwitcher(
                    duration: kAnimationDurationShort,
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child
                    ),
                    child: child
                );
              }
            ),
            ElevatedButton(
              onPressed: () => context.read<LoadRandomJokeCubit>()
                .getRandomJoke(_selectedCategory),
              child: Text(localization.buttonText)
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