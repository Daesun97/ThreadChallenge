import 'package:flutter/material.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //X 신고옵션
    final List<String> option = [
      '전기통산사업법에 의거하여 불법촬영물등 신고',
      '관심 없는 게시물 입니다',
      '의심스럽거나 스팸입니다',
      '민감한 사진 또는 동영상을 보여주고 있습니다.',
      '가학적이거나 유해한 내용입니다.',
      '오해의 소지가 있습니다.',
      '자살 또는 자해의도를 포현하고 있습니다.'
    ];
    void ontTap() {
      Navigator.pop(context);
    }

    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.75,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Sizes.size14),
            topRight: Radius.circular(Sizes.size14),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v14,
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(Sizes.size3),
              ),
            ),
            Gaps.v14,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: Column(
                children: [
                  const Text(
                    '문제 신고하기',
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.h12,
                  Divider(
                    height: 1,
                    color: Colors.grey.shade200,
                  ),
                  Gaps.v12,
                  Text(
                    '조금 더 자세히 설명해주세요. 이게시물에 어떤 문제가 있나요?',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Gaps.h12,
                  Divider(
                    height: 1,
                    color: Colors.grey.shade200,
                  ),
                  Gaps.v12,
                  Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: false,
                    child: ListView.separated(
                        shrinkWrap: true,
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size12),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              option[index],
                              style: const TextStyle(fontSize: Sizes.size16),
                            ),
                            onTap: ontTap,
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                              height: 1,
                              color: Colors.grey.shade200,
                            ),
                        itemCount: option.length),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
