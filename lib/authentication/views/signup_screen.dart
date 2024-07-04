import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:treadchallange/authentication/view_model/signup_vm.dart';
import 'package:treadchallange/authentication/widgets/auth_form_button.dart';
import 'package:treadchallange/authentication/widgets/auth_form_field.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/utils/form_check.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeName = "signup";
  static const routeUrl = "/";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var formValues = <String, String>{};

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSaved({required String key, required String value}) {
    formValues[key] = value;
  }

  void _onLoginPressed() {
    context.pop();
  }

  void _onSignUpPressed() async {
    final formstate = _formKey.currentState!;
    //애러가 있나없나 확인
    final valid = formstate.validate();
    if (!valid) {
      return;
    }
    formstate.save();
    await ref.read(signupProvider.notifier).signUp(
          email: formValues['email']!,
          password: formValues['password']!,
        );

    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(signupProvider).isLoading;

    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Column(
              children: [
                Gaps.v96,
                Container(
                  alignment: Alignment.center,
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Threads_%28app%29.svg/135px-Threads_%28app%29.svg.png'),
                ),
                Gaps.v96,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthFormField(
                        hintText: '이메일형식을 지켜주세요',
                        validator: FormCheck.emailCheck,
                        onSaved: (value) => _onSaved(
                          key: 'email',
                          value: value!,
                        ),
                      ),
                      Gaps.v20,
                      AuthFormField(
                        hintText: '8글자 이상',
                        validator: FormCheck.passwordCheck,
                        onSaved: (value) => _onSaved(
                          key: 'password',
                          value: value!,
                        ),
                      ),
                      Gaps.v20,
                      AuthFormButton(
                        title: '회원 가입',
                        onPressed: _onSignUpPressed,
                        isEnabled: !isLoading,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(Sizes.size10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size20,
                  ),
                  child: GestureDetector(
                    onTap: () => _onLoginPressed(),
                    child: const Center(
                      child: Text(
                        '아이디가 이미 있나요?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size16),
                      ),
                    ),
                  ),
                ),
                Gaps.v52,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
