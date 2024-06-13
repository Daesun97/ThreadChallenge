import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/detail_view_screen.dart';
import 'package:treadchallange/report_screen.dart';
import 'package:treadchallange/widgets/icons.dart';

class TextPost extends StatefulWidget {
  const TextPost({
    super.key,
    required this.userName,
    required this.content,
    required this.avatarUrl,
  });

  final String userName, content, avatarUrl;

  @override
  State<TextPost> createState() => _TextPostState();
}

class _TextPostState extends State<TextPost> {
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
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(Sizes.size14),
          child: Column(
            children: [
              FractionallySizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(widget.avatarUrl),
                    ),
                    Gaps.h16,
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
                          Gaps.v6,
                          Text(
                            maxLines: 3,
                            softWrap: true,
                            widget.content,
                            style: const TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w600),
                          ),
                          const IconsFour(),
                          Text(
                            '댓글 2 · 좋아요 4',
                            style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () => _onEllispsisTap(context),
                        child: const FaIcon(FontAwesomeIcons.ellipsis))
                  ],
                ),
              ),
              Gaps.v10,
              const Divider(
                thickness: 1,
                height: 1,
              )
            ],
          ),
        ),
      ],
    );
  }
}
