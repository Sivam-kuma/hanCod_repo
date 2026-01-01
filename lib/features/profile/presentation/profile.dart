import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
               onTap: () {
                 context.go('/home');
               },
                child: SvgPicture.asset("assets/svg_icons/Back-Navs.svg")),
            SizedBox(width: 5,),
            const Text('My Account'),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [


            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      _getInitials(user?.displayName ?? 'FE'),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 16),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.displayName ?? 'Fathima Ebrahim',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user?.phoneNumber ?? '+91 908 786 4233',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),


            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffD7FFF0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                    'Wallet',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff5FCD70),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Text(
                      'Balance - 125',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),


            Expanded(
              child: ListView(
                children: [

                  _menuTile(Icons.edit, 'Edit Profile', () {}),
                  _menuTile(Icons.location_on, 'Saved Address', () {}),
                  _menuTile(Icons.description, 'Terms & Conditions', () {}),
                  _menuTile(Icons.privacy_tip, 'Privacy Policy', () {}),
                  _menuTile(Icons.group, 'Refer a Friend', () {}),
                  _menuTile(Icons.support_agent, 'Customer Support', () {}),


                  _menuTile(Icons.logout, 'Log Out', () async {
                    await FirebaseAuth.instance.signOut();
                    context.go('/');
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  String _getInitials(String name) {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, 2).toUpperCase();
  }


  Widget _menuTile(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(

        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.withValues(alpha: 0.3),
          )
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.grey),
          title: Text(title),
          onTap: onTap,
        ),
      ),
    );
  }
}
