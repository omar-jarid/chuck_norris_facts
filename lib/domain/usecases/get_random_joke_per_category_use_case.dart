import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/domain/repositories/joke_repository.dart';

class GetRandomJokePerCategoryUseCase {
  final JokeRepository repository;

  GetRandomJokePerCategoryUseCase(this.repository);

  Future<JokeModel> invoke(String category) async {
    return repository.getRandomJokePerCategory(category);
  }
}