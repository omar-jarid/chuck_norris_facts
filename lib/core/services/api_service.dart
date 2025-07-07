import 'package:dio/dio.dart';

class ApiService {
  final Dio api;

  static const _baseURL = 'https://api.chucknorris.io/';

  ApiService(this.api) { api.options.baseUrl = _baseURL; }

  Future<Response> getCategories() => api.get("/jokes/categories");

  Future<Response> getRandomJoke() => api.get("/jokes/random");

  Future<Response> getRandomJokePerCategory(String category) {
    return api.get("/jokes/random?category=$category");
  }
}