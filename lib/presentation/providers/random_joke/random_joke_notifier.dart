import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/presentation/providers/random_joke/random_joke_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomJokeNotifier extends AsyncNotifier<JokeModel?> {
  @override
  Future<JokeModel?> build() async => null;

  Future<void> load({String? category}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => category == null
      ? ref.read(getRandomJokeUseCaseProvider).invoke()
      : ref.read(getRandomJokePerCategoryUseCaseProvider).invoke(category)
    );
  }
}