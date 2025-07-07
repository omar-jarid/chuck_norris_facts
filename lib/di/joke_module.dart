import 'package:chuck_norris_facts/di/abstract_module.dart';
import 'package:chuck_norris_facts/domain/repositories/joke_repository.dart';
import 'package:chuck_norris_facts/domain/usecases/get_random_joke_use_case.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_random_joke/load_random_joke_cubit.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

class JokeModule implements AbstractModule {
  static void configure(Injector injector) {
    /**************************** CUBIT ***************************************/
    injector.map<LoadRandomJokeCubit>(
      (i) => LoadRandomJokeCubit(i.get<GetRandomJokeUseCase>()),
      isSingleton: true
    );

    /**************************** USE CASES ***********************************/
    injector.map<GetRandomJokeUseCase>(
      (i) => GetRandomJokeUseCase(i.get<JokeRepository>()),
      isSingleton: false
    );
  }
}