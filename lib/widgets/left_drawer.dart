import 'package:flutter/material.dart';
import '../screens/menu.dart';
import '../screens/shoplist_form.dart';
import '../screens/shoplist_page.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
            // Drawer header
            decoration: BoxDecoration(
              color: Color.fromRGBO(66, 66, 66, 1),
            ),
            child: Column(
              children: [
                Text(
                  'Arto Moro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat dan/atau lihat seluruh produk pada Arto Moro kamu di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          // Bagian routing
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Halaman Utama',
              style: TextStyle(color: Colors.white),
            ),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.checklist,
              color: Colors.white,
            ),
            title: const Text(
              'Lihat Produk',
              style: TextStyle(color: Colors.white),
            ),
            // Bagian redirection ke ShopListPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopListPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            title: const Text(
              'Tambah Produk',
              style: TextStyle(color: Colors.white),
            ),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}