import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treadchallange/constans/sizes.dart';

class PrivarcyScreen extends StatefulWidget {
  static String routeName = 'privarcy';
  static String routeURL = 'privarcy';
  const PrivarcyScreen({super.key});

  @override
  State<PrivarcyScreen> createState() => _PrivarcyScreenState();
}

class _PrivarcyScreenState extends State<PrivarcyScreen> {
  bool _notification = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('보안'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: Column(
          children: [
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.lock,
                size: Sizes.size24,
              ),
              title: const Text(
                '개인 정보',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
              trailing: Switch(
                  value: _notification, onChanged: _onNotificationChanged),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.at,
                size: Sizes.size24,
              ),
              title: const Text(
                '맨션',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
              trailing: SizedBox(
                width: 56,
                height: 30,
                child: Row(
                  children: [
                    Text(
                      '모두',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_sharp,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.bellSlash,
                size: Sizes.size24,
              ),
              title: const Text(
                '알림음',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
              trailing: Icon(
                Icons.chevron_right_sharp,
                color: Colors.grey.shade400,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.eyeSlash,
                size: Sizes.size24,
              ),
              title: const Text(
                'hidden word',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
              trailing: Icon(
                Icons.chevron_right_sharp,
                color: Colors.grey.shade400,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.users,
                size: Sizes.size24,
              ),
              title: const Text(
                '팔로우 하는 계정',
                style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
              ),
              trailing: Icon(
                Icons.chevron_right_sharp,
                color: Colors.grey.shade400,
              ),
            ),
            ListTile(
                title: const Text(
                  '그외 개인적인 설정',
                  style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
                ),
                subtitle: Text(
                  '일부 설정(예: 제한)은 Threads와 Instagram 모두에 적용되며, Instagram에서 관리할 수 있습니다.',
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                trailing: Icon(
                  Icons.open_in_new,
                  color: Colors.grey.shade400,
                )),
            ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.circleXmark,
                  size: Sizes.size24,
                ),
                title: const Text(
                  '차단한 계정',
                  style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
                ),
                trailing: Icon(
                  Icons.open_in_new,
                  color: Colors.grey.shade400,
                )),
            ListTile(
                leading: const Icon(
                  CupertinoIcons.heart_slash,
                  size: Sizes.size24,
                ),
                title: const Text(
                  '좋아요 숨기기',
                  style: TextStyle(fontSize: Sizes.size16 + Sizes.size2),
                ),
                trailing: Icon(
                  Icons.open_in_new,
                  color: Colors.grey.shade400,
                )),
          ],
        ),
      ),
    );
  }
}
