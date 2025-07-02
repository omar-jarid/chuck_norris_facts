import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<String>> invoke() async => repository.getCategories();
}