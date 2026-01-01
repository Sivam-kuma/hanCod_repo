import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceIconCard extends StatelessWidget {
  final String name;
  final Color color;
  final String icon; // replace with SVG/PNG later

  const ServiceIconCard({super.key, required this.name, required this.icon,this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey[200],
          child: SvgPicture.asset(icon), // placeholder, replace with Image.asset or Svg
        ),
        const SizedBox(height: 4),
        Text(
          name,

          style: TextStyle(fontSize: 12,
          color: color),
        ),
      ],
    );
  }
}
