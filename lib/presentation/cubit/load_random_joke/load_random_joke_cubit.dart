import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/domain/usecases/get_random_joke_per_category_use_case.dart';
import 'package:chuck_norris_facts/domain/usecases/get_random_joke_use_case.dart';
import 'package:chuck_norris_facts/presentation/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'load_random_joke_cubit_state.dart';

class LoadRandomJokeCubit extends Cubit<LoadRandomJokeCubitState> {
  final GetRandomJokeUseCase _getRandomJokeUseCase;
  final GetRandomJokePerCategoryUseCase _getRandomJokePerCategoryUseCase;

  LoadRandomJokeCubit(
    this._getRandomJokeUseCase,
    this._getRandomJokePerCategoryUseCase
  ) : super(LoadRandomJokeCubitInitial());

  Future<void> getRandomJoke([String? category]) async {
    try {
      emit(LoadRandomJokeCubitLoading());

      final joke =
        category == null || category == 'none'
          ?await _getRandomJokeUseCase.invoke()
          :await _getRandomJokePerCategoryUseCase.invoke(category);

      emit(LoadRandomJokeCubitSuccess(joke));
    } on Exception catch (error) { emit(LoadRandomJokeCubitError(error)); }
  }
}