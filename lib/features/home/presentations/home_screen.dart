import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod/features/home/presentations/service_horizontal_card.dart';
import 'package:hancod/features/home/presentations/service_icon_card.dart';
//
// import '../../../providers/cleaning_provider.dart';
import '../../../shared/controllers/providers/cleaning_notifier.dart';
import 'navigation_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<String> addresses = [
    '406, Skyline Park Dale, MM Road',
    '502, Green Park, Delhi',
    '301, Sunshine Apartments, Mumbai'
  ];
  String selectedAddress = '406, Skyline Park Dale, MM Road';

  final List<Map<String, String>> availableServices = [
    {'name': 'Cleaning', 'icon': 'assets/svg_icons/cleaning 1.svg'},
    {'name': 'Waste Disposal', 'icon': 'assets/svg_icons/cleaning 1.svg'},
    {'name': 'Plumbing', 'icon': 'assets/svg_icons/cleaning 1.svg'},
    {'name': 'Carpentry', 'icon': 'assets/svg_icons/cleaning 1.svg'},
    {'name': 'Electrician', 'icon': 'assets/svg_icons/cleaning 1.svg'},
    {'name': 'Painting', 'icon': 'assets/svg_icons/cleaning 1.svg'},
    {'name': 'Painting', 'icon': 'assets/svg_icons/cleaning 1.svg'},
    {'name': 'Carpentry', 'icon': 'assets/svg_icons/cleaning 1.svg'},
    {'name': 'Carpentry', 'icon': 'assets/svg_icons/cleaning 1.svg'},
  ];

  final List<Map<String, String>> cleaningServices = [
    {'name': 'Home Cleaning', 'image': 'assets/png_icon/cleaning_img.png'},
    {'name': 'Carpet Cleaning', 'image': 'assets/png_icon/cleaning_img.png'},
    {'name': 'Sofa Cleaning', 'image': 'assets/png_icon/cleaning_img.png'},
  ];

  final TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final cleaningState = ref.watch(cleaningProvider);

    final cartItems =
    cleaningState.services.where((e) => e.quantity > 0).toList();

    final filteredServices = searchText.isEmpty
        ? availableServices
        : availableServices
        .where((s) =>
        s['name']!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    const limit = 9;
    final servicesToShow =
    filteredServices.take(limit).toList();

    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedAddress,
                            isExpanded: true,
                            icon: SvgPicture.asset(
                              "assets/svg_icons/Path 857.svg",
                              height: 10,
                              width: 10,
                            ),
                            items: addresses
                                .map(
                                  (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withValues(alpha: 0.5),
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                            onChanged: (val) {
                              setState(() => selectedAddress = val!);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset(
                            "assets/svg_icons/Buy.svg",
                            height: 30,
                            width: 30,
                          ),
                          if (cartItems.isNotEmpty)
                            Positioned(
                              right: -2,
                              top: -4,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Text(
                                  cartItems.length.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/png_icon/Promo Advertising.png',
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for a service',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                              'assets/svg_icons/search_icon.svg'),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      onChanged: (val) =>
                          setState(() => searchText = val),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Services',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 200,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: servicesToShow.length,
                            itemBuilder: (_, index) {
                              if (index >= 7) {
                                return const ServiceIconCard(
                                  name: "See All",
                                  icon: "assets/svg_icons/light.svg",
                                  color: Colors.green,
                                );
                              }
                              final service = servicesToShow[index];
                              return ServiceIconCard(
                                name: service['name']!,
                                icon: service['icon']!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cleaning Services',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withValues(alpha: 0.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go('/cleaning'),
                        child: const Text(
                          'See All',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cleaningServices.length,
                      itemBuilder: (_, i) => ServiceHorizontalCard(
                        name: cleaningServices[i]['name']!,
                        image: cleaningServices[i]['image']!,
                      ),
                    ),
                  ),

                  const SizedBox(height: 85),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: FloatingNavigationBar(),
            ),
          ),
        ],
      ),
    );
  }
}
