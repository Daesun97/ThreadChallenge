import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treadchallange/camera/camera_screen.dart';
import 'package:treadchallange/camera/preview_screen.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/main.dart';
import 'package:video_player/video_player.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late final VideoPlayerController _videoPlayerController;
  final TextEditingController _textEditingController = TextEditingController();
  final String _posting = "";
  bool _isWriting = false;

  void _onCancleTap() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
  }

  void _onTapcilp() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CameraScreen(),
    ));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _startWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _stopWriting,
      child: SizedBox(
        // padding: const EdgeInsets.symmetric(horizontal: Sizes.size),
        height: MediaQuery.of(context).size.height * 0.9,
        // clipBehavior: Clip.hardEdge,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(Sizes.size16),
        // ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              '새로운 쓰레드',
              style: TextStyle(
                  fontSize: Sizes.size20, fontWeight: FontWeight.bold),
            ),
            leadingWidth: 110,
            leading: GestureDetector(
              onTap: _onCancleTap,
              child: Container(
                padding: const EdgeInsets.all(Sizes.size10),
                child: const Text(
                  '취소',
                  style: TextStyle(
                      fontSize: Sizes.size16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //앱바에 밑줄
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey,
                height: 0.5,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(Sizes.size10),
            child: Column(
              //자식위젯의 고유 높이로 크기를 조정하는 위젯!
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          CircleAvatar(
                            child: Text('유저'),
                          ),
                          // Gaps.v12,
                          // VerticalDivider(
                          //   thickness: 3,
                          //   color: Colors.red,
                          // ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Gaps.h12,
                                Text(
                                  '유저닉네임',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.size16),
                                ),
                              ],
                            ),
                            Gaps.v10,
                            Expanded(
                              child: TextField(
                                onTap: _startWriting,
                                controller: _textEditingController,
                                //여러줄 작성 가능하게
                                minLines: null,
                                maxLines: null,
                                //키보드의 done을 enter로
                                textInputAction: TextInputAction.newline,
                                decoration: const InputDecoration(
                                  hintText: '쓰레드 작성을 시작...',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: Sizes.size10,
                                      horizontal: Sizes.size10),
                                ),
                                //suffix를 써봤지만 자판위에 올라오는게 아니라 포스트 창에
                                //올라오는 거였다...
                              ),
                            ),
                            IconButton(
                                onPressed: _onTapcilp,
                                icon: const FaIcon(FontAwesomeIcons.paperclip))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // PreviewScreen(
                //   video: video,
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.size10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '누구나 답글을 달 수 있습니다!',
                          style: TextStyle(
                              fontSize: Sizes.size16, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: AnimatedOpacity(
                            opacity: _posting != "" ? 1.0 : 0.4,
                            duration: const Duration(milliseconds: 300),
                            child: const Text(
                              '포스팅',
                              style: TextStyle(
                                  fontSize: Sizes.size20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
