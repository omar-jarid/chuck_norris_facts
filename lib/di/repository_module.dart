import 'package:chuck_norris_facts/data/datasources/network_datasource.dart';
import 'package:chuck_norris_facts/data/repositories/category_repository_impl.dart';
import 'package:chuck_norris_facts/data/repositories/joke_repository_impl.dart';
import 'package:chuck_norris_facts/di/abstract_module.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';
import 'package:chuck_norris_facts/domain/repositories/joke_repository.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

class RepositoryModule implements AbstractModule {
  static void configure(Injector injector) {
    injector.map<JokeRepository>(
      (i) => JokeRepositoryImpl(i.get<NetworkDataSource>()),
      isSingleton: true
    );

    injector.map<CategoryRepository>(
      (i) => CategoryRepositoryImpl(i.get<NetworkDataSource>()),
      isSingleton: true
    );
  }
}