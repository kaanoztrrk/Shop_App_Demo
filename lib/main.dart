import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Model/Cart_Model.dart';
import 'package:shop_app/Page/IntroPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        home: IntroPage(),
      ),
    );
  }
}
