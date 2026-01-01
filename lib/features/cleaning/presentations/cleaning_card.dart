import 'package:flutter/material.dart';
import '../../../shared/models/cleaning.dart';


class CleaningCard extends StatelessWidget {
  final Cleaning cleaning;
  final int count;
  final VoidCallback onAdd;
  final VoidCallback onPlus;
  final VoidCallback onMinus;

  const CleaningCard({
    super.key,
    required this.cleaning,
    required this.count,
    required this.onAdd,
    required this.onPlus,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [


          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 4),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset("assets/png_icon/cleaning.png", fit: BoxFit.cover),
                ),

                const SizedBox(width: 12),


                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("⭐ ${cleaning.rating} | 5",
                          style: const TextStyle(fontSize: 12)),
                      const SizedBox(height: 4),
                      Text(
                        cleaning.name,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withValues(alpha: 0.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "60 minutes",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "₹ ${cleaning.amount}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),


                      // const SizedBox(height: 36),
                    ],
                  ),
                ),
              ],
            ),
          ),


          Positioned(
            bottom: 0,
            right: 0,
            child: count == 0
                ? GestureDetector(
              onTap: onAdd,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff5FCD70),
                        Color(0xff0E826B),
                      ]
                      ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: const Text(
                  "Add  +",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
                : Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 2, vertical: 0),
              decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove,color: Colors.green, size: 18),
                    onPressed: onMinus,
                  ),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                      color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green, size: 18),
                    onPressed: onPlus,
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
