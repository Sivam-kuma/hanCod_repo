import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screens/auth/auth_choice_screen.dart';
import '../../screens/auth/phone_auth_screen.dart';
import '../../screens/cart_screen/main_screen.dart';
import '../../screens/cleaning/main_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/profile/profile.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const AuthChoiceScreen(),
      ),
      GoRoute(
        path: '/phone',
        builder: (_, __) => const PhoneAuthScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (_, __) => const HomeScreen(),
        // Scaffold(
        //   body: Center(child: Text("HOME SCREEN")),
        // ),
      ),
      GoRoute(
        path: '/profile',
        builder: (_, __) => const AccountScreen(),
      ),
      GoRoute(
        path: '/cleaning',
        builder: (_, __) => const CleaningListingScreen(),
      ),
      GoRoute(
        path: '/cart',
        builder: (_, __) => const CartScreen(),
      ),
    ],
  );
});
