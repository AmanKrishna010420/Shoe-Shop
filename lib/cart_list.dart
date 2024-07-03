import 'package:flutter/material.dart';
import 'package:shop/list_products.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          
          // Add null checks for cartItem values
          final imageUrl = cartItem['imageURL'] as String? ?? '';
          final name = cartItem['name'] as String? ?? 'No Name';
          final size = cartItem['size'] ?? 'Unknown Size';

          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageUrl),
            ),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Size : $size"),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Delete Item"),
                      content: SizedBox(
                        height: 100.0, // Set the height you need
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Are you sure you want to remove $name from the cart?",
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              cart.remove(cartItem);
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Item Removed Successfully!"),
                                  backgroundColor: Color.fromARGB(255, 131, 196, 240),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            });
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
