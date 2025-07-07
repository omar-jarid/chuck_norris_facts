import 'package:chuck_norris_facts/core/services/api_service.dart';
import 'package:chuck_norris_facts/domain/models/joke_model.dart';

abstract class NetworkDataSource {
  Future<JokeModel> getRandomJoke();

  Future<JokeModel> getRandomJokePerCategory(String category);

  Future<List<String>> getCategories();
}

class NetworkDataSourceImpl implements NetworkDataSource {
  final ApiService apiService;

  NetworkDataSourceImpl(this.apiService);

  @override
  Future<List<String>> getCategories() {
    return apiService.getCategories().then((response) => response.data);
  }

  @override
  Future<JokeModel> getRandomJoke() => apiService.getRandomJoke().then(
    (response) => response.data.toDomain()
  );

  @override
  Future<JokeModel> getRandomJokePerCategory(String category) {
    return apiService.getRandomJokePerCategory(category).then(
      (response) => response.data.toDomain()
    );
  }
}