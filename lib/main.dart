import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treadchallange/PostScreen.dart';
import 'package:treadchallange/body.dart';
import 'package:treadchallange/constans/sizes.dart';
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
    return const MaterialApp(
      home: ThreadScreen(),
    );
  }
}

class ThreadScreen extends StatefulWidget {
  const ThreadScreen({super.key});

  @override
  State<ThreadScreen> createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {
  final faker = Faker.instance;
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
              child: const Center(
                child: Text(
                  '검색',
                  style: TextStyle(fontSize: Sizes.size28),
                ),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const Center(
                child: PostScreen(),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const Center(
                child: Text(
                  '메시지',
                  style: TextStyle(fontSize: Sizes.size28),
                ),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const Center(
                child: Text(
                  '사용자 설정',
                  style: TextStyle(fontSize: Sizes.size28),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
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
