part of 'load_random_joke_cubit.dart';

@immutable
abstract class LoadRandomJokeCubitState {}

class LoadRandomJokeCubitInitial extends LoadRandomJokeCubitState {}

class LoadRandomJokeCubitLoading extends LoadRandomJokeCubitState {}

class LoadRandomJokeCubitSuccess extends BaseSuccess<JokeModel>
  implements LoadRandomJokeCubitState {
    const LoadRandomJokeCubitSuccess(super.result);
  }

class LoadRandomJokeCubitError extends BaseError
  implements LoadRandomJokeCubitState {
    const LoadRandomJokeCubitError(super.error);
  }