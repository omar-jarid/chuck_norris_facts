import 'package:chuck_norris_facts/domain/models/joke_model.dart';

abstract class JokeRepository {

  Future<JokeModel> getRandomJoke();

  Future<JokeModel> getRandomJokePerCategory(String category);
}