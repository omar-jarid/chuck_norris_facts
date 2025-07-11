import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/presentation/cubit/load_random_joke/load_random_joke_cubit.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris Facts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<LoadRandomJokeCubit, LoadRandomJokeCubitState>(
              listener: (context, state) {
                if (state is LoadRandomJokeCubitError) {
                  Fimber.e(state.error.toString());
                }
              },
              builder: (context, state) {
                if (state is LoadRandomJokeCubitInitial) {
                  return const _InitialLayout();
                } else if (state is LoadRandomJokeCubitLoading) {
                  return const _LoadingLayout();
                } else if (state is LoadRandomJokeCubitSuccess) {
                  return _SuccessLayout(state.result);
                }

                return Container();
              }
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LoadRandomJokeCubit>().getRandomJoke();
              },
              child: Text('Load random Chuck Norris fact')
            )
          ],
        ),
      ),
    );
  }
}

class _LoadingLayout extends StatelessWidget {
  const _LoadingLayout({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator()
  );
}

class _SuccessLayout extends StatelessWidget {
  final JokeModel joke;

  const _SuccessLayout(this.joke);

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.getAppDimens(context);

    return Padding(
      padding: EdgeInsets.all(dimens.defaultPadding),
      child: Column(
        children: [
          Image.network(
            joke.iconUrl,
            width: dimens.chuckNorrisIconSize,
            height: dimens.chuckNorrisIconSize
          ),
          Text(
            joke.value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge
          )
        ]
      )
    );
  }
}

class _InitialLayout extends StatelessWidget {
  const _InitialLayout({super.key});

  @override
  Widget build(BuildContext context) => Container();
}