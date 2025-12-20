import 'package:flutter/material.dart';

class ServiceHorizontalCard extends StatelessWidget {
  final String name;
  final String image; // replace with actual image later

  const ServiceHorizontalCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder for image
          Expanded(
            child: Container(
              height: 200,
              width: 210,
              child: Center(child: Image.asset(image)),
            ),
          ),
          const SizedBox(height: 8),
          Text(name,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withValues(alpha: 0.5),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
