import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/domain/usecases/get_random_joke_use_case.dart';
import 'package:chuck_norris_facts/presentation/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'load_random_joke_cubit_state.dart';

class LoadRandomJokeCubit extends Cubit<LoadRandomJokeCubitState> {
  final GetRandomJokeUseCase _getRandomJokeUseCase;

  LoadRandomJokeCubit(this._getRandomJokeUseCase)
    : super(LoadRandomJokeCubitInitial());

  Future<void> getRandomJoke() async {
    try {
      emit(LoadRandomJokeCubitLoading());
      final joke = await _getRandomJokeUseCase.invoke();
      emit(LoadRandomJokeCubitSuccess(joke));
    } on Exception catch (error) { emit(LoadRandomJokeCubitError(error)); }
  }
}