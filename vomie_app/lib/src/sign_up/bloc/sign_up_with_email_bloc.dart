import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:xoomie/src/base/widgets/localized_text.dart';
import 'package:xoomie/src/sign_up/bloc/sign_up_repository.dart';

class SignUpWithEmailBloc
    extends FormBloc<GenerateLocalizedString, GenerateLocalizedString> {
  final SignUpRepositoryBase repository;

  final emailField = TextFieldBloc<String>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
    initialValue: 'shad2@xoomie.webplex.io',
  );

  final passwordField = TextFieldBloc<String>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.passwordMin6Chars,
    ],
    initialValue: 'qw12QW!@',
  );

  SignUpWithEmailBloc({
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

      await repository.signUpWithEmailAndPassword(
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
        failureResponse: (x) => x.signUpWithEmailBlocSignUpFailed,
      );
    }
  }
}
