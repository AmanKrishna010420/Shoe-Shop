

import 'package:flutter/material.dart';
import 'package:shop/home_page.dart';
import 'package:shop/list_products.dart';

class ProdDetail extends StatelessWidget {
  final Map<String, Object> product;
  final List<int> sizes = [6, 7, 8, 9, 10, 11];
  final ValueNotifier<int> selectedSizeNotifier = ValueNotifier<int>(6);

  ProdDetail({
    super.key,
    required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const HomePage();},));
        }, icon: const Icon(Icons.arrow_back_ios,size: 32,)),
      ),
      body: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            product["name"] as String,
            style: const TextStyle(fontSize: 32, fontFamily: "Lato"),
          ),
          Image.network(
            product["imageURL"].toString(),
            height: 400,
          ),
          const SizedBox(height: 50),
          Text(product["price"].toString() + "\$" , 
          style: const TextStyle(fontSize: 38, fontFamily: "Lato")),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                final size = sizes[index];
                return GestureDetector(
                  onTap: () {
                    selectedSizeNotifier.value = size;
                  },
                  child: ValueListenableBuilder<int>(
                    valueListenable: selectedSizeNotifier,
                    builder: (context, selectedSize, child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                          backgroundColor: selectedSize == size
                              ? Colors.amber
                              : const Color.fromARGB(255, 246, 244, 240),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          label: Text(size.toString()),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 280,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  cart.add({
                    "name":product["name"] as String,
                    "size":selectedSizeNotifier.value,
                    "imageURL":product["imageURL"] as String,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                    backgroundColor: Color.fromARGB(255, 131, 196, 240) ,
                    content: Text("Item Added To Cart"),
                    duration:Duration(seconds: 1) ,));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.amber),
                ),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                label: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height:70),
        ],
      ),
    );
  }
}
