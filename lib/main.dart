import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:treadchallange/PostScreen.dart';
import 'package:treadchallange/activity_screen.dart';
import 'package:treadchallange/body.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/profile_screen.dart';
import 'package:treadchallange/router.dart';
import 'package:treadchallange/search_screen.dart';
import 'package:treadchallange/widgets/nav_tab.dart';
import 'package:faker_dart/faker_dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      themeMode: ThemeMode.system,
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
  final String currentPage;
  static const routeURL = '/';
  const ThreadScreen({super.key, required this.currentPage});

  @override
  State<ThreadScreen> createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {
  final faker = Faker.instance;
  int _selectedIndex = 0;

  void _onTap(int index) {
    //여기에서 각 인덱스 마다 context.push를 박아? 안됨ㅋㅋ
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        context.go(ThreadScreen.routeURL);
      } else if (index == 1) {
        context.go(SearchScreen.routeURL);
      } else if (index == 3) {
        context.push(ActivityScreen.routeURL);
      } else if (index == 4) {
        context.go(ProfileScreen.routeURL);
      }
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
