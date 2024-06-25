import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:treadchallange/Settings_screen.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/widgets/PersistentTabBar.dart';

class ProfileScreen extends StatefulWidget {
  static String routeURL = '/profile';
  static String routeName = 'profile';
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onBarsPlessed() {
    context.push(SettingScreen.routeURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const FaIcon(FontAwesomeIcons.globe),
                actions: [
                  IconButton(
                    onPressed: _onBarsPlessed,
                    icon: const FaIcon(FontAwesomeIcons.barsStaggered),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text(
                          '유저이름',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size24,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '유저_이메일',
                                  style: TextStyle(fontSize: Sizes.size16),
                                ),
                                Gaps.h10,
                                Container(
                                  padding: const EdgeInsets.all(Sizes.size6),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size20)),
                                  child: Text(
                                    'threads.net',
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  ),
                                )
                              ],
                            ),
                            Gaps.v6,
                            const Text(
                              '유저의 한 문장 설명!',
                              style: TextStyle(fontSize: Sizes.size16),
                            )
                          ],
                        ),
                        trailing: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/dog.jpg"),
                        ),
                      ),
                      Row(
                        //왜 왼쪽으로 안붙지??
                        //Stack이 들어갈 크기도 줬고 정렬도 했고 최소한으로 공간 차지해라 까지 했는데 왜
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gaps.h14,
                          const SizedBox(
                            width: Sizes.size80,
                            height: Sizes.size52,
                            child: Stack(
                              clipBehavior: Clip.antiAlias,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                    'assets/images/dog.jpg',
                                  ),
                                ),
                                Positioned(
                                  left: Sizes.size24,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                      'assets/images/cat.jpg',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.h10,
                          Text(
                            '2 followers',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: Sizes.size16),
                          )
                        ],
                      ),
                      Gaps.v12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(
                                Sizes.size14,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Edit profile",
                                style: TextStyle(
                                    // color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Gaps.h20,
                          Container(
                            width: 150,
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(
                                Sizes.size14,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Share profile",
                                style: TextStyle(
                                    // color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size3,
                    mainAxisSpacing: Sizes.size3,
                    childAspectRatio: 9 / 14),
                itemBuilder: (context, index) => Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 14,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/dog.jpg',
                          image:
                              'https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525071226651wwqg.jpg'),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size3,
                    mainAxisSpacing: Sizes.size3,
                    childAspectRatio: 9 / 14),
                itemBuilder: (context, index) => Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 14,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/cat.jpg',
                          image:
                              'https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525071226651wwqg.jpg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
