import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';

final tabs = [
  "All",
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class ActivityScreen extends StatefulWidget {
  static String routeURL = '/activity';
  static String routeName = 'activity';
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Activity',
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size14),
              color: Colors.black,
            ),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            labelColor: Colors.white,
            // unselectedLabelColor: Colors.black,
            isScrollable: true,
            // indicatorColor: Colors.black,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size16,
            ),
            tabs: [
              for (var tab in tabs)
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(Sizes.size14)),
                  width: Sizes.size72,
                  child: Tab(
                    text: tab,
                  ),
                ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              ListTile(
                minVerticalPadding: Sizes.size16,
                leading: const SizedBox(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: Sizes.size24,
                        backgroundImage: AssetImage(
                          'assets/images/cat.jpg',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: Sizes.size24,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: '새로운 계정',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.black,
                        fontSize: Sizes.size20),
                    children: [
                      TextSpan(
                        text: ' 1h',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: Sizes.size16),
                      ),
                    ],
                  ),
                ),
                subtitle: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        maxLines: 2, overflow: TextOverflow.ellipsis, '행운의 편지'),
                    Gaps.v3,
                    Text(
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다.")
                  ],
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size16,
                ),
              ),
              ListTile(
                minVerticalPadding: Sizes.size16,
                leading: const SizedBox(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: Sizes.size24,
                        backgroundImage: AssetImage(
                          'assets/images/cat.jpg',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: Sizes.size24,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: '새로운 계정',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.black,
                        fontSize: Sizes.size20),
                    children: [
                      TextSpan(
                        text: ' 1h',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: Sizes.size16),
                      ),
                    ],
                  ),
                ),
                subtitle: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        maxLines: 2, overflow: TextOverflow.ellipsis, '행운의 편지'),
                    Gaps.v3,
                    Text(
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다.")
                  ],
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size16,
                ),
              ),
              ListTile(
                minVerticalPadding: Sizes.size16,
                leading: const SizedBox(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: Sizes.size24,
                        backgroundImage: AssetImage(
                          'assets/images/cat.jpg',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: Sizes.size24,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: '새로운 계정',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.black,
                        fontSize: Sizes.size20),
                    children: [
                      TextSpan(
                        text: ' 1h',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: Sizes.size16),
                      ),
                    ],
                  ),
                ),
                subtitle: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        maxLines: 2, overflow: TextOverflow.ellipsis, '행운의 편지'),
                    Gaps.v3,
                    Text(
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다.")
                  ],
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size16,
                ),
              ),
              ListTile(
                minVerticalPadding: Sizes.size16,
                leading: const SizedBox(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: Sizes.size24,
                        backgroundImage: AssetImage(
                          'assets/images/cat.jpg',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: Sizes.size24,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: '새로운 계정',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.black,
                        fontSize: Sizes.size20),
                    children: [
                      TextSpan(
                        text: ' 1h',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: Sizes.size16),
                      ),
                    ],
                  ),
                ),
                subtitle: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        maxLines: 2, overflow: TextOverflow.ellipsis, '행운의 편지'),
                    Gaps.v3,
                    Text(
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다.")
                  ],
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size16,
                ),
              ),
              ListTile(
                minVerticalPadding: Sizes.size16,
                leading: const SizedBox(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: Sizes.size24,
                        backgroundImage: AssetImage(
                          'assets/images/cat.jpg',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: Sizes.size24,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: '새로운 계정',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.black,
                        fontSize: Sizes.size20),
                    children: [
                      TextSpan(
                        text: ' 1h',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: Sizes.size16),
                      ),
                    ],
                  ),
                ),
                subtitle: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        maxLines: 2, overflow: TextOverflow.ellipsis, '행운의 편지'),
                    Gaps.v3,
                    Text(
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다.")
                  ],
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size16,
                ),
              ),
              ListTile(
                minVerticalPadding: Sizes.size16,
                leading: const SizedBox(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: Sizes.size24,
                        backgroundImage: AssetImage(
                          'assets/images/cat.jpg',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: Sizes.size24,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: '새로운 계정',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.black,
                        fontSize: Sizes.size20),
                    children: [
                      TextSpan(
                        text: ' 1h',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: Sizes.size16),
                      ),
                    ],
                  ),
                ),
                subtitle: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        maxLines: 2, overflow: TextOverflow.ellipsis, '행운의 편지'),
                    Gaps.v3,
                    Text(
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다.")
                  ],
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
