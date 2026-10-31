import 'package:chuck_norris_facts/core/services/api_service.dart';
import 'package:chuck_norris_facts/data/datasources/network_datasource.dart';
import 'package:chuck_norris_facts/data/repositories/category_repository_impl.dart';
import 'package:chuck_norris_facts/data/repositories/joke_repository_impl.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';
import 'package:chuck_norris_facts/domain/repositories/joke_repository.dart';
import 'package:chuck_norris_facts/domain/usecases/get_categories_use_case.dart';
import 'package:chuck_norris_facts/domain/usecases/get_random_joke_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecases/get_random_joke_per_category_use_case.dart';

final dioProvider = Provider<Dio>((_) => Dio());

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.watch(dioProvider))
);

final networkDataSourceProvider = Provider<NetworkDataSource>(
  (ref) => NetworkDataSourceImpl(ref.watch(apiServiceProvider))
);

final jokeRepositoryProvider = Provider<JokeRepository>(
  (ref) => JokeRepositoryImpl(ref.watch(networkDataSourceProvider))
);

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryImpl(ref.watch(networkDataSourceProvider))
);

final getCategoriesUseCaseProvider = Provider<GetCategoriesUseCase>(
  (ref) => GetCategoriesUseCase(ref.watch(categoryRepositoryProvider))
);

final getRandomJokeUseCaseProvider = Provider<GetRandomJokeUseCase>(
  (ref) => GetRandomJokeUseCase(ref.watch(jokeRepositoryProvider))
);

final getRandomJokePerCategoryUseCaseProvider =
  Provider<GetRandomJokePerCategoryUseCase>(
    (ref) => GetRandomJokePerCategoryUseCase(ref.watch(jokeRepositoryProvider))
  );