import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/privarcy_screen.dart';

class SettingScreen extends StatefulWidget {
  static String routeURL = '/settings';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isLogout = false;

  void _onLogoutTap() {
    Navigator.of(context).pop();
    setState(() {
      _isLogout = true;
    });
  }

  void _onPrivacyTap() {
    context.pushNamed(PrivarcyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: Column(
          children: [
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userPlus,
                size: Sizes.size24,
              ),
              title: Text(
                '친구 팔로우 혹은 초대',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
                size: Sizes.size24,
              ),
              title: Text(
                '알림 설정',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
            ),
            GestureDetector(
              onTap: _onPrivacyTap,
              child: const ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.lock,
                  size: Sizes.size24,
                ),
                title: Text(
                  '보안',
                  style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
                ),
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleUser,
                size: Sizes.size24,
              ),
              title: Text(
                '계정 설정',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.lifeRing,
                size: Sizes.size24,
              ),
              title: Text(
                '도움',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.guitar,
                size: Sizes.size24,
              ),
              title: Text(
                '기타',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
            ),
            ListTile(
              title: const Text('Log Out (Ios / Buttom)'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('진짜로?'),
                    actions: [
                      CupertinoActionSheetAction(
                          onPressed: () {}, child: const Text('안나감')),
                      CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: _onLogoutTap,
                          child: const Text('나감'))
                    ],
                  ),
                );
              },
              trailing:
                  _isLogout ? const CircularProgressIndicator.adaptive() : null,
            ),
          ],
        ),
      ),
    );
  }
}
