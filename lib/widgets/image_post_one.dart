import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/detail_view_screen.dart';
import 'package:treadchallange/widgets/icons.dart';

class OneImagePost extends StatefulWidget {
  const OneImagePost({
    super.key,
    required this.avatarUrl,
    required this.content,
    required this.userName,
  });

  final String avatarUrl, content, userName;

  @override
  State<OneImagePost> createState() => _OneImagePostState();
}

class _OneImagePostState extends State<OneImagePost> {
  void _onEllispsisTap(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const DetailViewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.size14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              //유저 아바타, 유저이름, 내용(글)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(widget.avatarUrl),
                  ),
                  Gaps.h20,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userName,
                          style: const TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.bold),
                        ),
                        Gaps.v10,
                        Text(
                          widget.content,
                          style: const TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () => _onEllispsisTap(context),
                      child: const FaIcon(FontAwesomeIcons.ellipsis))
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: Sizes.size60),
            child: SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/Civilization7.jpg',
                  fit: BoxFit.contain,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Sizes.size60),
            child: Column(
              children: [
                const IconsFour(),
                Gaps.v6,
                Text(
                  '댓글 2 · 좋아요 4',
                  style: TextStyle(
                      fontSize: Sizes.size16, color: Colors.grey.shade400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
