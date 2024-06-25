import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  const NavTab(
      {super.key,
      required this.isSelected,
      required this.icon,
      required this.onTap,
      required this.selectedIcon});

  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //tab하면 물결모양 나옴
      child: InkWell(
        onTap: () => onTap(),
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.6,
          duration: const Duration(milliseconds: 250),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
                // color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
