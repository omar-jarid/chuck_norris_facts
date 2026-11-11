import 'package:chuck_norris_facts/generated/app_localizations.dart';
import 'package:chuck_norris_facts/presentation/utils/dimens.dart';
import 'package:material_ui/material_ui.dart';

export 'package:chuck_norris_facts/generated/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  AppDimensions get dimens => Dimens.getAppDimens(this);
}