import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/sign_in/bloc/sign_in_repository.dart';

class SignInWithEmailBloc
    extends FormBloc<GenerateLocalizedString, GenerateLocalizedString> {
  final SignInRepositoryBase repository;

  final emailField = TextFieldBloc<String>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
    initialValue: 'shad@xoomie.webplex.io',
  );

  final passwordField = TextFieldBloc<String>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.passwordMin6Chars,
    ],
    initialValue: 'qw12QW!@',
  );

  SignInWithEmailBloc({
    required this.repository,
  }) {
    addFieldBloc(fieldBloc: emailField);
    addFieldBloc(fieldBloc: passwordField);
  }

  @override
  Future<void> close() {
    emailField.close();
    passwordField.close();
    return super.close();
  }

  @override
  Future<void> onSubmitting() async {
    try {
      emitSubmitting();

      await repository.signInWithEmailAndPassword(
        email: emailField.value,
        password: passwordField.value,
      );

      emitSuccess();
    } on FirebaseAuthException catch (e) {
      emitFailure(
        failureResponse: (x) => e.message!,
      );
    } catch (e) {
      emitFailure(
        failureResponse: (x) => x.signInWithEmailBlocSignUpFailed,
      );
    }
  }
}
