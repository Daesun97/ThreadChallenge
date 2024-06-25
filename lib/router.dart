import 'package:go_router/go_router.dart';
import 'package:treadchallange/Settings_screen.dart';
import 'package:treadchallange/activity_screen.dart';
import 'package:treadchallange/main.dart';
import 'package:treadchallange/privarcy_screen.dart';
import 'package:treadchallange/profile_screen.dart';
import 'package:treadchallange/search_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: ThreadScreen.routeURL,
      builder: (context, state) {
        final currentPage = state.queryParams['page'] ?? 'home';
        return ThreadScreen(currentPage: currentPage);
      },
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
