import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:arto_moro/models/item.dart';
import 'package:arto_moro/screens/item_details_page.dart';
import 'package:arto_moro/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Future<List<Item>> response = request
        // https://rakha-abid-tugas.pbp.cs.ui.ac.id/user-json
        // .postJson("http://localhost:8000/user-json/",
        .postJson("http://localhost:8000/user-json",
            jsonEncode(<String, String>{"Content-Type": "application/json"}))
        .then((value) {
      if (value == null) {
        return [];
      }
      var jsonValue = jsonDecode(value);
      List<Item> listItem = [];
      for (var data in jsonValue) {
        if (data != null) {
          listItem.add(Item.fromJson(data));
        }
      }
      return listItem;
    });
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Daftar Item'),
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.white,
        ),
        // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: response,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data item.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Amount: ${snapshot.data![index].fields.amount}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Description: ${snapshot.data![index].fields.description}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey.shade700),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ItemDetailsPage(
                                              snapshot.data![index])),
                                    );
                                  },
                                  child: const Text(
                                    "See Details",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}