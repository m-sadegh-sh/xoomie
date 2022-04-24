import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

typedef GenerateLocalizedString = String Function(AppLocalizations);

class LocalizedText extends StatelessWidget {
  final GenerateLocalizedString? onGenerate;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LocalizedText(
    this.onGenerate, {
    this.style,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  static String get(
    BuildContext context,
    GenerateLocalizedString onGenerate,
  ) {
    final localizations = AppLocalizations.of(context)!;
    return onGenerate.call(localizations);
  }

  @override
  Widget build(BuildContext context) {
    final text = onGenerate == null ? '' : get(context, onGenerate!);

    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
