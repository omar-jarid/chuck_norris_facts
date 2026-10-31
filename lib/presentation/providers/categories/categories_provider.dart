import 'package:chuck_norris_facts/domain/usecases/get_categories_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

final getCategoriesUseCaseProvider = Provider<GetCategoriesUseCase>((ref) {
  return Injector().get<GetCategoriesUseCase>();
});

final categoriesProvider = FutureProvider<List<String>>((ref) {
  return ref.watch(getCategoriesUseCaseProvider).invoke();
});