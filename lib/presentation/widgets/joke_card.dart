import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final JokeModel joke;

  const JokeCard(this.joke, {super.key});

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.getAppDimens(context);

    return Card(
      elevation: dimens.cardElevation,
      shape: RoundedRectangleBorder(borderRadius: .circular(dimens.cardRadius)),
      margin: .all(dimens.defaultPadding),
      child: Padding(
        padding: .all(dimens.defaultPadding),
        child: Column(
          children: [
            Image.network(
              joke.iconUrl,
              width: dimens.chuckNorrisIconSize,
              height: dimens.chuckNorrisIconSize
            ),
            SizedBox(height: dimens.size12),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  joke.value,
                  textAlign: .center,
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ),
            )
          ]
        )
      )
    );
  }
}
