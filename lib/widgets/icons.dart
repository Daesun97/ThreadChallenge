import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';

// 게시물 밑의 아이콘 4개

class IconsFour extends StatelessWidget {
  const IconsFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.heart,
            size: Sizes.size20,
          ),
          Gaps.h20,
          FaIcon(
            FontAwesomeIcons.comment,
            size: Sizes.size20,
          ),
          Gaps.h20,
          FaIcon(
            FontAwesomeIcons.repeat,
            size: Sizes.size20,
          ),
          Gaps.h20,
          FaIcon(
            FontAwesomeIcons.paperPlane,
            size: Sizes.size20,
          ),
        ],
      ),
    );
  }
}
