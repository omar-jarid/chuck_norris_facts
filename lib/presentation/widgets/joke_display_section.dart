import 'package:chuck_norris_facts/constants/constants.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_random_joke/load_random_joke_cubit.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:chuck_norris_facts/presentation/widgets/joke_card.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JokeDisplaySection extends StatelessWidget {
  final String selectedCategory;

  const JokeDisplaySection({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.getAppDimens(context);
    final localization = AppLocalizations.of(context)!;

    return BlocConsumer<LoadRandomJokeCubit, LoadRandomJokeCubitState>(
      listener: (context, state) {
        if (state is LoadRandomJokeCubitError) Fimber.e(state.error.toString());
      },
      builder: (context, state) {
        final isLoading = state is LoadRandomJokeCubitLoading;
        final isSuccess = state is LoadRandomJokeCubitSuccess;

        Widget child = isSuccess ? JokeCard(state.result) : Container();

        return Column(
          children: [
            AnimatedSwitcher(
              duration: kAnimationDurationShort,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child
              ),
              child: child
            ),
            ElevatedButton(
              onPressed: () => context.read<LoadRandomJokeCubit>()
                .getRandomJoke(selectedCategory),
              child: isLoading ? SizedBox(
                width: dimens.size20,
                height: dimens.size20,
                child: const CircularProgressIndicator()
              ) : Text(localization.buttonText)
            )
          ],
        );
      }
    );
  }
}
