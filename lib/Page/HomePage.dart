// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Model/Cart_Model.dart';
import 'package:shop_app/Page/CardPage.dart';
import 'package:shop_app/Product/Widget/GroceryItemTile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              )),
          child: const Icon(Icons.shopping_basket),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* good Morning
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text("Good Morning")),
            //*Let's order fresh items for you
            const SizedBox(height: 5),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Let's order fresh items for you",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const SizedBox(height: 24),

            //* divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(thickness: 1),
            ),
            //* fresh Items + grid
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    final item = value.shopItems[index];
                    return GroceryItemTile(
                      itemName: item[0],
                      itemPrice: item[1],
                      itemPath: item[2],
                      color: item[3],
                      onpressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToList(index);
                      },
                    );
                  },
                );
              },
            ))
          ],
        ));
  }
}
