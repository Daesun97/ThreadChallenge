import 'package:flutter/material.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/widgets/image_post.dart';
import 'package:treadchallange/widgets/image_post_one.dart';
import 'package:treadchallange/widgets/text_post.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gaps.v20,
            //텍스트로만 되어있는 게시물 2개

            TextPost(
                userName: '렉돌열두스푼',
                content: '고양이는 귀엽습니다. 렉돌은 12배 더 귀엽죠',
                avatarUrl: 'assets/images/cat.jpg'),
            TextPost(
              userName: 'Samoyed',
              content: '사모예드도 만만치 않게 귀엽죠, 복슬복슬합니다.',
              avatarUrl: 'assets/images/dog.jpg',
            ),
            //사진 게시물 스크롤 되게
            ImagePost(
                avatarUrl: 'assets/images/Civilization7.jpg',
                content: '내년에 나오는 최고 인기 게임들',
                userName: '라리안 스튜디오 KR'),
            // //스크롤 안되는 사진 하나
            OneImagePost(
                avatarUrl: 'assets/images/BaldursGate3.jpg',
                content: '이번에 나오는 신작게임입니다. 아주 재밌겠죠?',
                userName: '올해의 게임'),
          ],
        ),
      ),
    );
  }
}
