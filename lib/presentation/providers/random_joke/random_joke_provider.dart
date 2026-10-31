import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/presentation/providers/random_joke/random_joke_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomJokeProvider =
  AsyncNotifierProvider<RandomJokeNotifier, JokeModel?>(RandomJokeNotifier.new);