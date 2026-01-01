import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

// import '../../../providers/cleaning_provider.dart';
import '../../../shared/controllers/providers/cleaning_notifier.dart';
import 'cleaning_card.dart';

class CleaningListingScreen extends ConsumerStatefulWidget {
  const CleaningListingScreen({super.key});

  @override
  ConsumerState<CleaningListingScreen> createState() =>
      _ServiceListingScreenState();
}

class _ServiceListingScreenState
    extends ConsumerState<CleaningListingScreen> {

  @override
  Widget build(BuildContext context) {
    final cleaningState = ref.watch(cleaningProvider);
    final services = cleaningState.services;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg_icons/Back-Navs.svg"),
          onPressed: () {
            context.go("/home");
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Cleaning Services",
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.7),
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
            itemCount: services.length,
            itemBuilder: (_, i) {
              final service = services[i];
              final count = service.quantity;

              return CleaningCard(
                cleaning: service,
                count: count,
                onAdd: () {
                  ref.read(cleaningProvider.notifier).increment(service);
                },
                onPlus: () {
                  ref.read(cleaningProvider.notifier).increment(service);
                },
                onMinus: () {
                  ref.read(cleaningProvider.notifier).decrement(service);
                },
              );
            },
          ),

          if (services.any((e) => e.quantity > 0))
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  context.go('/cart');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "${services.where((e) => e.quantity > 0).length}: Items | ₹${services.where((e) => e.quantity > 0).fold<int>(0, (sum, e) => sum + (e.amount * e.quantity))}",
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xffFF6B4A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "View Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SvgPicture.asset(
                                  "assets/svg_icons/cart_arrow.svg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

