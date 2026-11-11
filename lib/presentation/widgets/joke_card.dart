import 'package:chuck_norris_facts/domain/models/joke_model.dart';
import 'package:chuck_norris_facts/presentation/utils/context_extensions.dart';
import 'package:material_ui/material_ui.dart';

class JokeCard extends StatelessWidget {
  final JokeModel joke;

  const JokeCard(this.joke, {super.key});

  @override
  Widget build(BuildContext context) => Card(
    elevation: context.dimens.cardElevation,
    shape: RoundedRectangleBorder(
      borderRadius: .circular(context.dimens.cardRadius)
    ),
    margin: .all(context.dimens.defaultPadding),
    child: Padding(
      padding: .all(context.dimens.defaultPadding),
      child: Column(
        children: [
          Image.network(
            joke.iconUrl,
            width: context.dimens.chuckNorrisIconSize,
            height: context.dimens.chuckNorrisIconSize
          ),
          SizedBox(height: context.dimens.size12),
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
