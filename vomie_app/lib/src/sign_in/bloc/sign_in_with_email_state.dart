import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:zoomie/src/base/widgets/localized_text.dart';

typedef SignInWithEmailStateBase
    = FormBlocState<GenerateLocalizedString, GenerateLocalizedString>;

typedef SignInWithEmailSigningInState
    = FormBlocSubmitting<GenerateLocalizedString, GenerateLocalizedString>;

typedef SignInWithEmailSignInFailedState
    = FormBlocFailure<GenerateLocalizedString, GenerateLocalizedString>;
