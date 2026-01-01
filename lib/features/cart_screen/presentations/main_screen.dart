import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
// import '../../../providers/cleaning_provider.dart';
import '../../../shared/controllers/providers/cleaning_notifier.dart';
import '../../../shared/models/cleaning.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cartAsync = ref.watch(cartProvider);
    final cleaningState = ref.watch(cleaningProvider);

    final cartItems = cleaningState.services
        .where((item) => item.quantity > 0)
        .toList();


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset("assets/svg_icons/Back-Navs.svg"),
            onPressed: () {
              // ref.invalidate(cartProvider);
              context.go("/cleaning");},
          ),
          backgroundColor: Colors.white,
          title:  Text("Cart", style: TextStyle(
              color: Colors.black.withValues(alpha: 0.7),
              fontSize: 20),)),

      body: Builder(
        builder: (_) {
          if (cartItems.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          final subtotal = cartItems.fold<int>(
            0,
                (sum, item) => sum + (item.amount * item.quantity),
          );

          const taxes = 50;
          const coupon = 50;
          final total = subtotal + taxes - coupon;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...cartItems.map((item) => _cartItemTile(ref, item)),

                const SizedBox(height: 5),

                TextButton(
                  onPressed: () => context.go("/cleaning"),
                  child: Text(
                    "Add more Services",
                    style: TextStyle(
                      color: Colors.green.withValues(alpha: 0.7),
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                _couponSection(),

                const SizedBox(height: 16),

                _walletInfo(),

                const SizedBox(height: 16),

                _billDetails(
                  cartItems,
                  subtotal,
                  taxes,
                  coupon,
                  total,
                ),

                const SizedBox(height: 16),

                Padding(
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
                        Text("Grand Total | ₹$total"),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            context.go("/home");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff5FCD70),
                                  Color(0xff0E826B),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Book Slot",
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _cartItemTile(WidgetRef ref, Cleaning item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(item.name)),
          Row(
            children: [
              SizedBox(
                height: 27,
                width: 27,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha:0.7),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Center(child: const Icon(Icons.remove , color: Colors.white,size: 13,)),
                      onPressed: () async {
                        ref.read(cleaningProvider.notifier).decrement(item);
                        // await ref
                        //     .read(cleaningRepositoryProvider)
                        //     .decrementQuantity(item.id, item.quantity);
                        // ref.invalidate(cartProvider);
                        // ref.invalidate(servicesProvider);
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 27,
                width: 35,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha:0.2),
                    borderRadius: BorderRadius.all(Radius.circular(2))
                  ),
                  child: Center(child: Text(item.quantity.toString()))),
              SizedBox(
                height: 27,
                width: 27,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha:0.7),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add , color: Colors.white,size: 13,),
                    onPressed: () async {
                      ref.read(cleaningProvider.notifier).increment(item);

                      // await ref
                      //     .read(cleaningRepositoryProvider)
                      //     .incrementQuantity(item.id, item.quantity);
                      // ref.invalidate(cartProvider);
                      // ref.invalidate(servicesProvider);
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Text("₹${item.amount * item.quantity}"),
        ],
      ),
    );
  }


  Widget _couponSection() {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text("Coupon Code",
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.6),
                    fontSize: 16,
                  ),),
              ),
            ),
          ),
         Column(
           children: [
             SizedBox(height: 50,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15.0),
               child: Center(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child:
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Coupon Code",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xff5FCD70),
                                            Color(0xff0E826B),
                                          ]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                        child: const Text("Apply", style: TextStyle(color: Colors.white),)),
                      ],
                    ),
                  // ],
                  // ),
                ),
                       ),
             ),
             SizedBox(height: 20,),
           ],
         ),
    ],
      ),
    );
  }


  Widget _walletInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/svg_icons/done.svg"),
          const SizedBox(width: 8,),
          Expanded(
            child: Text(
              "Your wallet balance is ₹125, you can redeem ₹10 in this order.",
              style: TextStyle(color: Colors.black.withValues(alpha: 0.6)),
            ),
          ),
        ],
      ),
    );
  }


  Widget _billDetails(
      List<Cleaning> items,
      int subtotal,
      int taxes,
      int coupon,
      int total,
      ) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children:[
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text("Bill Details",
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.6),
                    fontSize: 16,
                  ),),
              ),
            ),
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 35),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   "Bill Details",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 8),
              ...items.map(
                    (e) => _billRow(e.name, "₹${e.amount * e.quantity}"),
              ),
              _billRow("Taxes and Fees", "₹$taxes"),
              _billRow("Coupon Code", "-₹$coupon"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(child: SvgPicture.asset("assets/svg_icons/border_svg.svg",)),
              ),
              _billRow("Total", "₹$total", bold: true),
            ],
                   ),
         ),
      ]
      ),
    );
  }

  Widget _billRow(String title, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
          Text(value,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
        ],
      ),
    );
  }
}
