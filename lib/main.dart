import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treadchallange/PostScreen.dart';
import 'package:treadchallange/activity_screen.dart';
import 'package:treadchallange/body.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/firebase_options.dart';
import 'package:treadchallange/profile_screen.dart';
import 'package:treadchallange/router.dart';
import 'package:treadchallange/search/view/search_screen.dart';
import 'package:treadchallange/setting/model/darkmode_config_model.dart';
import 'package:treadchallange/setting/repo/darkmode_repo.dart';
import 'package:treadchallange/setting/view_model/darkmode_vm.dart';
import 'package:treadchallange/widgets/nav_tab.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // final preferences = await SharedPreferences.getInstance();
  // final repository = DarkModeConfigRepository(preferences);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => DarkModeConfigModel(),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (context) => DarkModeConfigViewModel(
    //         themeModeService: context.read(),
    //       ),
    //     ),
    //   ],
    //   child: const MyApp(),
    // ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      themeMode: ref.watch(themeDarkModeProvider),
      // themeMode: context.watch<DarkModeConfigModel>().themeDarkMode,
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(),
        useMaterial3: true,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size28,
          ),
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.black),
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.grey.shade500,
            labelColor: Colors.blue.shade200,
            unselectedLabelColor: Colors.grey.shade200,
          ),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.grey.shade200),
            backgroundColor: Colors.grey.shade900,
            surfaceTintColor: Colors.grey.shade900,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size28,
            ),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.blue,
          ),
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.blue,
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey.shade800,
          ),
          brightness: Brightness.dark),
    );
  }
}

class ThreadScreen extends StatefulWidget {
  // final String currentPage;
  static const routeName = 'MainNavigation';
  final String tab;
  const ThreadScreen({super.key, required this.tab});

  @override
  State<ThreadScreen> createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {
  final faker = Faker.instance;
  final List<String> _tabs = [
    'home',
    'search',
    'inbox',
    'activity',
    'profile',
  ];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go('/${_tabs[index]}');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const FaIcon(
            FontAwesomeIcons.threads,
            size: Sizes.size32,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const BodyScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const SearchScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const Center(
                child: PostScreen(),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const ActivityScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const ProfileScreen(),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          // color: Colors.white,
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                    isSelected: _selectedIndex == 0,
                    icon: FontAwesomeIcons.personShelter,
                    onTap: () => _onTap(0),
                    selectedIcon: FontAwesomeIcons.house),
                NavTab(
                    isSelected: _selectedIndex == 1,
                    icon: FontAwesomeIcons.magnifyingGlass,
                    onTap: () => _onTap(1),
                    selectedIcon: FontAwesomeIcons.magnifyingGlass),
                NavTab(
                    isSelected: _selectedIndex == 2,
                    icon: FontAwesomeIcons.penToSquare,
                    onTap: () => _onTap(2),
                    selectedIcon: FontAwesomeIcons.solidPenToSquare),
                NavTab(
                    isSelected: _selectedIndex == 3,
                    icon: FontAwesomeIcons.heart,
                    onTap: () => _onTap(3),
                    selectedIcon: FontAwesomeIcons.solidHeart),
                NavTab(
                    isSelected: _selectedIndex == 4,
                    icon: FontAwesomeIcons.user,
                    onTap: () => _onTap(4),
                    selectedIcon: FontAwesomeIcons.solidUser),
              ],
            ),
          ),
        ));
  }
}
