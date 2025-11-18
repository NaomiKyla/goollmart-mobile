import 'package:flutter/material.dart';
import 'package:goollmart/screens/menu.dart';
import 'package:goollmart/screens/product_form.dart';
import 'package:goollmart/screens/item_entry_list.dart';
import 'package:goollmart/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF0B1120),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LOGO
                Image.asset(
                  "assets/logo.png",
                  height: 48,
                ),
                const SizedBox(width: 12),

                // TEXT
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GoollMart',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Temukan produkmu di sini!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

          // Home
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),

          // Navigasi ke Form Tambah Produk
          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text('Create Product'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductFormPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Item List'),
            onTap: () {
                // Route to news list page
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ItemListPage()),
                  );
              },
          ),

          const Divider(),

          // LOGOUT BUTTON
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final request = context.read<CookieRequest>();
              final response = await request.logout("http://localhost:8000/auth/logout/",);
              
              if (!context.mounted) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      response["message"] ?? "Successfully logged out.",
                    ),
                  ),
              );
            },
          ),
        ],
      ),
    );
  }
}
