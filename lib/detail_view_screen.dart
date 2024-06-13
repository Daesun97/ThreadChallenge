import 'package:flutter/material.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';
import 'package:treadchallange/report_screen.dart';

class DetailViewScreen extends StatefulWidget {
  const DetailViewScreen({super.key});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  void _onReportTap(BuildContext context) async {
    //첫번째 바텀시트 컷
    Navigator.pop(context);
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => const ReportScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size12),
          topRight: Radius.circular(Sizes.size12),
        ),
      ),
      child: Column(
        children: [
          Gaps.v14,
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(
                Sizes.size3,
              ),
            ),
            width: Sizes.size96,
            height: Sizes.size5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size14,
              horizontal: Sizes.size20,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(Sizes.size10)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size24,
                      vertical: Sizes.size12,
                    ),
                    child: Text(
                      '언팔하기',
                      style: TextStyle(
                          fontSize: Sizes.size20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size24,
                      vertical: Sizes.size12,
                    ),
                    child: Text(
                      '차단하기',
                      style: TextStyle(
                          fontSize: Sizes.size20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gaps.v20,
          //const Divider(height: 1.5, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size14,
              horizontal: Sizes.size20,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(Sizes.size10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size24,
                      vertical: Sizes.size12,
                    ),
                    child: Text(
                      '숨기기',
                      style: TextStyle(
                          fontSize: Sizes.size20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(height: 1, color: Colors.grey),
                  GestureDetector(
                    onTap: () => _onReportTap(context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size24,
                        vertical: Sizes.size12,
                      ),
                      child: Text(
                        '신고하기',
                        style: TextStyle(
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
