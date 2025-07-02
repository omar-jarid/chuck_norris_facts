import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/domain/repositories/joke_repository.dart';

class GetRandomJokeUseCase {
  final JokeRepository repository;

  GetRandomJokeUseCase(this.repository);

  Future<JokeModel> invoke() async => repository.getRandomJoke();
}