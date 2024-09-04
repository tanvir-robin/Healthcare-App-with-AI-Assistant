import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care_ex/src/controllers/auth_controller.dart';
import 'package:health_care_ex/src/pages/about_us.dart';
import 'package:health_care_ex/src/pages/chat_screen.dart';
import 'package:health_care_ex/src/pages/medicine_shop.dart';

class CustomDrawer extends StatelessWidget {
  final user = AuthController.userData;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user?['name'] ?? 'Shefa'),
            accountEmail: Text(user?['email'] ?? 'shfa@g.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: user!['imageUrl'] != null
                  ? CachedNetworkImageProvider(user!['imageUrl'])
                  : null,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text('All Doctors'),
            onTap: () {
              // Navigate to All Doctors Screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Appointments'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Medicine'),
            onTap: () {
              Get.to(() => MedicineShopPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text('Assistance'),
            onTap: () {
              // Navigate to Assistance Screen
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ChatScreen(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Get.to(() => AboutPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact Us'),
            onTap: () {
              // Navigate to Contact Us Screen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sign Out'),
            onTap: () {
              // Sign out the user
              FirebaseAuth.instance.signOut();
              // Add your sign-out logic here
            },
          ),
        ],
      ),
    );
  }
}
