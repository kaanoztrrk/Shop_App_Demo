import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Model/Cart_Model.dart';
import 'package:shop_app/Page/HomePage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 50),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            )),
                        icon: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(30),
                    child: Text("My Cart",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ))),
                Expanded(
                    child: ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(12.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12.0)),
                      child: ListTile(
                          leading: Image.asset(value.cartItems[index][2]),
                          title: Text(value.cartItems[index][0]),
                          subtitle: Text(value.cartItems[index][1]),
                          trailing: IconButton(
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemToList(index);
                            },
                            icon: const Icon(Icons.cancel),
                          )),
                    );
                  },
                )),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Balance",
                                style: TextStyle(color: Colors.blue[100])),
                            const SizedBox(height: 5),
                            Text(
                              "\$ ${value.calculateTotal()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue.shade100),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Row(
                            children: [
                              Text(
                                "Pay Now",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
