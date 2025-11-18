import 'package:flutter/material.dart';
import 'package:goollmart/models/item_entry.dart';
import 'package:goollmart/widgets/left_drawer.dart';
import 'package:goollmart/widgets/item_entry_card.dart';
import 'package:goollmart/screens/item_detail.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  Future<List<ItemEntry>> fetchItems(CookieRequest request) async {
    final response = await request.get(
        'http://localhost:8000/json/user/'
    );

    List<ItemEntry> listItems = [];
    for (var d in response) {
      if (d != null) {
        listItems.add(ItemEntry.fromJson(d));
      }
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        backgroundColor: Color(0xFF0B1120),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchItems(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No items found in your store.',
                style: TextStyle(fontSize: 20, color: Color(0xFF0B1120)),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => ItemCard(
              item: snapshot.data![index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailPage(
                      item: snapshot.data![index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
