import 'package:chuck_norris_facts/core/services/api_service.dart';
import 'package:chuck_norris_facts/data/models/joke_dto_model.dart';
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
  Future<List<String>> getCategories() async {
    final response = await apiService.getCategories();
    return List<String>.from(response.data);
  }

  @override
  Future<JokeModel> getRandomJoke() async {
    final response = await apiService.getRandomJoke();
    final data = response.data as Map<String, dynamic>;

    return JokeDtoModel.fromJson(data).toDomain();
  }

  @override
  Future<JokeModel> getRandomJokePerCategory(String category) async {
    final response = await apiService.getRandomJokePerCategory(category);
    final data = response.data as Map<String, dynamic>;

    return JokeDtoModel.fromJson(data).toDomain();
  }
}