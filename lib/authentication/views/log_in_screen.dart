import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:treadchallange/authentication/view_model/login_vm.dart';
import 'package:treadchallange/authentication/views/signup_screen.dart';
import 'package:treadchallange/authentication/widgets/auth_form_button.dart';
import 'package:treadchallange/authentication/widgets/auth_form_field.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/utils/form_check.dart';

class LogInScreen extends ConsumerStatefulWidget {
  static String routeURL = "/login";
  static String routeName = "login";
  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  var formValues = <String, String>{};

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSaved({required String key, required String value}) {
    formValues[key] = value;
  }

  void _onLogInPress() async {
    final formState = _formKey.currentState!;
    final valid = formState.validate();
    if (!valid) {
      return;
    }
    formState.save();

    await ref.read(logInViewModelProvider.notifier).logIn(
          formValues['email']!,
          formValues['password']!,
          context,
        );
    if (mounted) {
      context.go('/home');
    }
  }

  void _onCreateAccountPressed(BuildContext context) {
    context.pushNamed(SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(logInViewModelProvider).isLoading;
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          title: const Text(
            '한국어(KOR)',
            style: TextStyle(
              fontSize: Sizes.size24,
              color: Colors.grey,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        hintText: '이메일',
                        validator: FormCheck.emailCheck,
                        onSaved: (value) => _onSaved(
                          key: 'email',
                          value: value!,
                        ),
                      ),
                      Gaps.v20,
                      AuthFormField(
                        hintText: '비밀번호',
                        validator: FormCheck.passwordCheck,
                        onSaved: (value) => _onSaved(
                          key: 'password',
                          value: value!,
                        ),
                      ),
                      Gaps.v20,
                      AuthFormButton(
                        title: '로그인',
                        onPressed: _onLogInPress,
                        isEnabled: !isLoading,
                      )
                    ],
                  ),
                ),
                Gaps.v20,
                const Text(
                  "비밀번호를 잊으셧나요?",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                  padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
                  child: GestureDetector(
                    onTap: () => _onCreateAccountPressed(context),
                    child: const Center(
                      child: Text(
                        '처음 오시나요?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Gaps.v20,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.github,
                      size: Sizes.size20,
                      color: Colors.grey.shade600,
                    ),
                    Gaps.h10,
                    Text(
                      '깃 허브',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
