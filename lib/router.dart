import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:treadchallange/authentication/repository/auth_repo.dart';
import 'package:treadchallange/authentication/views/log_in_screen.dart';
import 'package:treadchallange/authentication/views/signup_screen.dart';
import 'package:treadchallange/setting/views/Settings_screen.dart';
import 'package:treadchallange/activity_screen.dart';
import 'package:treadchallange/main.dart';
import 'package:treadchallange/setting/views/privarcy_screen.dart';
import 'package:treadchallange/profile_screen.dart';
import 'package:treadchallange/search/view/search_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/home',
    redirect: (context, state) {
      //유저가 로그인 됐는가 확인
      final isLogedIn = ref.read(authRepoProvider).isLogedIn;
      //유저가 로그인이 안 돼있는데
      if (!isLogedIn) {
        //가입 화면이나 로그인 화면이 아니라면
        if (state.subloc != SignUpScreen.routeUrl &&
            state.subloc != LogInScreen.routeURL) {
          //처음화면으로(가입)
          return LogInScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/:tab(home|search|inbox|activity|profile)',
        name: ThreadScreen.routeName,
        builder: (context, state) {
          final tab = state.params['tab']!;
          return ThreadScreen(
            tab: tab,
          );
        },
      ),
      GoRoute(
        name: LogInScreen.routeName,
        path: LogInScreen.routeURL,
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeUrl,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: SearchScreen.routeURL,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: ActivityScreen.routeURL,
        builder: (context, state) => const ActivityScreen(),
      ),
      GoRoute(
        path: ProfileScreen.routeURL,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
          path: SettingScreen.routeURL,
          builder: (context, state) => const SettingScreen(),
          routes: [
            GoRoute(
              name: PrivarcyScreen.routeName,
              path: PrivarcyScreen.routeURL,
              builder: (context, state) => const PrivarcyScreen(),
            )
          ]),
      // GoRoute(
      //   path: PrivarcyScreen.routeURL,
      //   builder: (context, state) => const PrivarcyScreen(),
      // )
    ],
  );
});
