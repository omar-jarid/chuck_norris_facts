import 'package:chuck_norris_facts/data/datasources/network_datasource.dart';
import 'package:chuck_norris_facts/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final NetworkDataSource networkDataSource;

  CategoryRepositoryImpl(this.networkDataSource);

  @override
  Future<List<String>> getCategories() => networkDataSource.getCategories();
}