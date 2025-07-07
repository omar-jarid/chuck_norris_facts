import 'package:chuck_norris_facts/data/datasources/network_datasource.dart';
import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/domain/repositories/joke_repository.dart';

class JokeRepositoryImpl implements JokeRepository {
  final NetworkDataSource networkDataSource;

  JokeRepositoryImpl(this.networkDataSource);

  @override
  Future<JokeModel> getRandomJoke() => networkDataSource.getRandomJoke();

  @override
  Future<JokeModel> getRandomJokePerCategory(String category) {
    return networkDataSource.getRandomJokePerCategory(category);
  }
}