import 'package:chuck_norris_facts/domain/usecases/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadCategoriesCubit extends Cubit<List<String>> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  LoadCategoriesCubit(this._getCategoriesUseCase) : super([]);

  Future<void> loadCategories() async {
    try {
      await _getCategoriesUseCase.invoke().then(
        (categories) => emit(categories)
      );
    } catch (e) { emit([]); }
  }
}
