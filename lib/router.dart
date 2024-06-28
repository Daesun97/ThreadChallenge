import 'package:go_router/go_router.dart';
import 'package:treadchallange/setting/views/Settings_screen.dart';
import 'package:treadchallange/activity_screen.dart';
import 'package:treadchallange/main.dart';
import 'package:treadchallange/setting/views/privarcy_screen.dart';
import 'package:treadchallange/profile_screen.dart';
import 'package:treadchallange/search_screen.dart';

final router = GoRouter(
  initialLocation: '/home',
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
