import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treadchallange/constans/gaps.dart';
import 'package:treadchallange/constans/sizes.dart';

class SearchScreen extends StatefulWidget {
  static String routeURL = '/search';
  static String routeName = 'search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final ScrollController _scrollController = ScrollController();
  final List<String> _notifications = List.generate(20, (index) => "$index");

  final TextEditingController _textEditingController =
      TextEditingController(text: "검색");
  void _onSearchChanged(String value) {}

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '검 색',
          style: TextStyle(fontSize: Sizes.size24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: CupertinoSearchTextField(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
                controller: _textEditingController,
                onChanged: _onSearchChanged,
              ),
            ),
            Gaps.v14,
            for (var notification in _notifications)
              ListTile(
                minVerticalPadding: Sizes.size16,
                leading: const CircleAvatar(
                  radius: Sizes.size24,
                  backgroundImage: AssetImage('assets/images/dog.jpg'),
                ),
                title: Row(
                  children: [
                    Text(
                      '멍멍이 $notification',
                      style: const TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.h7,
                    const Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: Sizes.size16,
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '썰매 개 $notification',
                      style: TextStyle(
                          fontSize: Sizes.size16, color: Colors.grey.shade400),
                    ),
                    Text(
                      '1$notification K followers',
                      style: const TextStyle(fontSize: Sizes.size20),
                    )
                  ],
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 4,
                  ),
                  child: const Text(
                    'Follow',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.size16),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
