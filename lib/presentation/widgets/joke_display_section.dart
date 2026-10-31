import 'package:chuck_norris_facts/generated/app_localizations.dart';
import 'package:chuck_norris_facts/presentation/providers/random_joke/random_joke_provider.dart';
import 'package:chuck_norris_facts/presentation/widgets/joke_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JokeDisplaySection extends ConsumerWidget {
  final String selectedCategory;

  const JokeDisplaySection({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref.watch(
    randomJokeProvider
  ).when(
    loading: () => const Center(child: CircularProgressIndicator()),
    data: (joke) => joke == null ? Container() : JokeCard(joke),
    error: (error, _) => Center(
      child: Text(AppLocalizations.of(context)?.couldNotLoadJoke(error) ?? '')
    ),
  );
}
