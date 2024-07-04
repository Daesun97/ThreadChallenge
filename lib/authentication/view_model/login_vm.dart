import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:treadchallange/authentication/repository/auth_repo.dart';
import 'package:treadchallange/utils/darkmode.dart';

class LoginViewModel extends AsyncNotifier {
  late final AuthenticationRepository _repository;

  @override
  FutureOr build() {
    _repository = ref.read(authRepoProvider);
  }

  Future<void> logIn(
      String email, String password, BuildContext context) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => await _repository.signIn(email, password),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go('/home');
    }
  }
}

final logInViewModelProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
