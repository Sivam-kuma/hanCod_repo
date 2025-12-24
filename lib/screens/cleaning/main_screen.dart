import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/screens/cleaning/cleaning_card.dart';

import '../../providers/cleaning_provider.dart';


class CleaningListingScreen extends ConsumerStatefulWidget {
  const CleaningListingScreen({super.key});

  @override
  ConsumerState<CleaningListingScreen> createState() =>
      _ServiceListingScreenState();
}

class _ServiceListingScreenState
    extends ConsumerState<CleaningListingScreen> {

  final Map<String, int> cartCount = {};

  @override
  Widget build(BuildContext context) {
    final servicesAsync = ref.watch(servicesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg_icons/Back-Navs.svg"),
          onPressed: () {
            ref.invalidate(cartProvider);
            context.go("/home");
          },
        ),
          backgroundColor: Colors.white,
          title:  Text("Cleaning Services", style: TextStyle(
              color: Colors.black.withValues(alpha: 0.7),
              fontSize: 20),)),

      body: servicesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (services) {
          return Stack(
            children: [


              ListView.builder(
                padding: const EdgeInsets.only(top:60,right: 20,left: 20),
                itemCount: services.length,
                itemBuilder: (_, i) {
                  final service = services[i];
                  final count = service.quantity ?? 0;

                  return CleaningCard(
                    cleaning: service,
                    count: count,
                    onAdd: () async {
                      await ref
                          .read(cleaningRepositoryProvider)
                          .incrementQuantity(service.id, count);

                      ref.invalidate(servicesProvider);
                    },
                    onPlus: () async {
                      await ref
                          .read(cleaningRepositoryProvider)
                          .incrementQuantity(service.id, count);

                      ref.invalidate(servicesProvider);
                    },
                    onMinus: () async {
                    await ref
                        .read(cleaningRepositoryProvider)
                        .decrementQuantity(service.id, count);

                    ref.invalidate(servicesProvider);
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
                    onTap: (){
                      ref.invalidate(cartProvider);
                      context.go('/cart');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 16,bottom: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Text("${services.where((e) => e.quantity > 0).length}: Items | ₹${services.where((e) => e.quantity > 0).map((e) => e.amount * e.quantity).reduce((a, b) => a + b)}"),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xffFF6B4A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "View Cart",
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                  SvgPicture.asset("assets/svg_icons/cart_arrow.svg"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
