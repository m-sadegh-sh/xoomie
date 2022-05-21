import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';

typedef SignUpWithEmailStateBase
    = FormBlocState<GenerateLocalizedString, GenerateLocalizedString>;

typedef SignUpWithEmailSigningUpState
    = FormBlocSubmitting<GenerateLocalizedString, GenerateLocalizedString>;

typedef SignUpWithEmailSignUpFailedState
    = FormBlocFailure<GenerateLocalizedString, GenerateLocalizedString>;
