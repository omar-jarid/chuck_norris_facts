import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/domain/usecases/get_random_joke_per_category_use_case.dart';
import 'package:chuck_norris_facts/domain/usecases/get_random_joke_use_case.dart';
import 'package:chuck_norris_facts/presentation/providers/random_joke/random_joke_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

final getRandomJokeUseCaseProvider = Provider<GetRandomJokeUseCase>((ref) {
  return Injector().get<GetRandomJokeUseCase>();
});

final getRandomJokePerCategoryUseCaseProvider =
  Provider<GetRandomJokePerCategoryUseCase>((ref) {
    return Injector().get<GetRandomJokePerCategoryUseCase>();
  });

final randomJokeProvider =
  AsyncNotifierProvider<RandomJokeNotifier, JokeModel?>(RandomJokeNotifier.new);