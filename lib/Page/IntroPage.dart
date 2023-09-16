// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:shop_app/Product/Image_Generator/ImageGeneretor.dart';

import 'HomePage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //* logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60) +
                const EdgeInsets.only(bottom: 40, top: 120),
            child: Image.asset(ImageEnum.avocado.toPath),
          ),
          //*title
          const Padding(
              padding: EdgeInsets.all(30),
              child: Text("We deliver groceries at your doorstep",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ))),
          //*subtitle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Grooceer gives your fresh vegetables and fruits. Order fresh items from grooceer",
              textAlign: TextAlign.center,
            ),
          ),
          //*button
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade100,
                  shape: const StadiumBorder()),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  "Get Started",
                ),
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
