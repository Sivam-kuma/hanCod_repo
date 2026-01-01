import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class NavigationBox extends StatelessWidget {
  const NavigationBox({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.showText,
  });

  final String text;
  final String icon;
  final bool isSelected;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(
        horizontal: showText ? 12 : 8,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.green.withValues(alpha: 0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 18,
            width: 18,
            color: isSelected
                ? Colors.green
                : Colors.black.withValues(alpha: 0.5),
          ),

          if (showText) ...[
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? Colors.black
                    : Colors.black.withValues(alpha: 0.5),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

