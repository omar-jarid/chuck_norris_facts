import 'package:chuck_norris_facts/di/abstract_module.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';
import 'package:chuck_norris_facts/domain/repositories/joke_repository.dart';
import 'package:chuck_norris_facts/domain/usecases/get_categories_use_case.dart';
import 'package:chuck_norris_facts/domain/usecases/get_random_joke_use_case.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_categories/load_categories_cubit.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_random_joke/load_random_joke_cubit.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

class CategoryModule implements AbstractModule {
  static void configure(Injector injector) {
    /**************************** CUBIT ***************************************/
    injector.map<LoadCategoriesCubit>(
      (i) => LoadCategoriesCubit(i.get<GetCategoriesUseCase>()),
      isSingleton: true
    );

    /**************************** USE CASES ***********************************/
    injector.map<GetCategoriesUseCase>(
      (i) => GetCategoriesUseCase(i.get<CategoryRepository>()),
      isSingleton: false
    );
  }
}