import 'package:chuck_norris_facts/di/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = FutureProvider<List<String>>((ref) {
  return ref.watch(getCategoriesUseCaseProvider).invoke();
});