
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../providers/auth_provider.dart';

class AuthChoiceScreen extends ConsumerWidget {
  const AuthChoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: Colors.white,
               ),
                 child: Image.asset("assets/png_icon/hancod_logo.jpg")),

            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () async {
                // Step 1: Open Google account picker
                final googleUser = await GoogleSignIn().signIn();
                if (googleUser == null) return;

                // Step 2: Get auth tokens
                final googleAuth = await googleUser.authentication;

                // Step 3: Create Firebase credential
                final credential = GoogleAuthProvider.credential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken,
                );

                // Step 4: Sign in to Firebase
                await ref
                    .read(authProvider)
                    .signInWithCredential(credential);

                // Step 5: Navigate to home
                context.go('/home');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20,),
                  Column(
                    children: [
                      const SizedBox(height: 10,),
                      SvgPicture.asset("assets/svg_icons/google_svg.svg"),
                    ],
                  ),
                  const Text("Continue with Google"),
                  const SizedBox(width: 20,),
                ],
              ),
            ),

            const SizedBox(height: 20),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: GestureDetector(
                onTap: () {
                  context.go('/phone');
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Phone",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
