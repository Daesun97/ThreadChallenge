import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:treadchallange/constans/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      child: const TabBar(
        // indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        // labelColor: Colors.black,
        labelPadding: EdgeInsets.symmetric(vertical: Sizes.size10),
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: Text(
              'Threads',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: Text(
              'Repiels',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
  //The paintExtent is 46.0, but the layoutExtent is 47.0.

  @override
  double get maxExtent => 44;

  @override
  double get minExtent => 44;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
