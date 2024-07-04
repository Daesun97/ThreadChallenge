import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treadchallange/authentication/repository/auth_repo.dart';
import 'package:treadchallange/utils/darkmode.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepoProvider);
  }

  Future<void> signUp({required String email, required String password}) async {
    //시작할때 로딩중이라고 알리고
    state = const AsyncValue.loading();

    //끝나면 로딩상태 없애기
    state = await AsyncValue.guard(
      () async =>
          await _authRepo.createAccount(email: email, password: password),
    );
    // if (state.hasError) {
    //   showFirebaseErrorSnack(context, state.error);
    // }
    // else {
    //   context.goNamed(InterestScreen.routeName);
    // }
  }
}

final signUpForm = StateProvider((ref) => {});

final signupProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
