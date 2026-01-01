import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_box.dart';

class FloatingNavigationBar extends StatefulWidget {
  const FloatingNavigationBar({super.key});

  @override
  State<FloatingNavigationBar> createState() =>
      FloatingNavigationBarState();
}

class FloatingNavigationBarState extends State<FloatingNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isCompact = constraints.maxWidth < 360;

        return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              _navItem(
                index: 0,
                label: 'Home',
                icon: 'assets/svg_icons/Home.svg',
                route: '/home',
                isCompact: isCompact,
              ),
              _navItem(
                index: 1,
                label: 'Bookings',
                icon: 'assets/svg_icons/calendar (1) 1.svg',
                route: '/booking',
                isCompact: isCompact,
              ),
              _navItem(
                index: 2,
                label: 'Account',
                icon: 'assets/svg_icons/Group.svg',
                route: '/profile',
                isCompact: isCompact,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _navItem({
    required int index,
    required String label,
    required String icon,
    required String route,
    required bool isCompact,
  }) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedIndex = index);
          context.go(route);
        },
        child: NavigationBox(
          text: label,
          icon: icon,
          isSelected: isSelected,
          showText: !isCompact || isSelected,
        ),
      ),
    );
  }
}

