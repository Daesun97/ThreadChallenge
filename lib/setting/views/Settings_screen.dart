import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/setting/model/darkmode_config_model.dart';
import 'package:treadchallange/setting/view_model/darkmode_vm.dart';
import 'package:treadchallange/setting/views/privarcy_screen.dart';

class SettingScreen extends ConsumerStatefulWidget {
  static String routeURL = '/settings';
  const SettingScreen({super.key});

  @override
  createState() => SettingScreenState();
}

class SettingScreenState extends ConsumerState<SettingScreen> {
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

  String _appearanceTitle(ThemeMode mode) => switch (mode) {
        ThemeMode.system => "System",
        ThemeMode.light => "Light",
        ThemeMode.dark => "Dark",
      };

  void _onAppearanceTap(BuildContext context, WidgetRef ref) {
    void buttonPressed(ThemeMode mode) {
      ref.read(darkmodeViewModelProvider.notifier).switchThemeMode(mode);
      // context.read<DarkModeConfigModel>().switchThemeMode(mode);
      context.pop();
    }

    List<Widget> actions = ThemeMode.values.map((mode) {
      final title = _appearanceTitle(mode);
      // context.read<DarkModeConfigViewModel>()._appearanceTitle(mode);
      final textStyle = Theme.of(context).textTheme.bodyMedium;
      return Platform.isIOS
          ? CupertinoDialogAction(
              onPressed: () => buttonPressed(mode),
              child: Text(
                title,
                style: textStyle?.copyWith(color: Colors.blue),
              ),
            )
          : TextButton(
              onPressed: () => buttonPressed(mode),
              child: Text(title, style: textStyle),
            );
    }).toList();
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(actions: actions),
    );
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
            ListTile(
              leading: const Icon(FontAwesomeIcons.circleHalfStroke),
              title: const Text("다크모드 설정"),
              trailing: Text(
                _appearanceTitle(ref.watch(darkmodeViewModelProvider)),
                // context.watch<DarkModeConfigViewModel>().current_AppearanceTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              onTap: () => _onAppearanceTap(context, ref),
            ),
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
