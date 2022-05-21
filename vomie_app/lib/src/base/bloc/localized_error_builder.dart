import 'package:flutter/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:zoomie/src/base/widgets/localized_text.dart';

String localizedErrorBuilder(BuildContext context, Object? error) {
  switch (error) {
    case FieldBlocValidatorsErrors.required:
      return LocalizedText.get(context, (x) => x.formValidationRequired);
    case FieldBlocValidatorsErrors.email:
      return LocalizedText.get(context, (x) => x.formValidationEmail);
    default:
      return error?.toString() ?? '';
  }
}
