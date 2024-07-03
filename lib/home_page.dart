
import 'package:flutter/material.dart';
import 'package:shop/cart_list.dart';
// import 'package:shop/list_products.dart';
// import 'package:shop/prod_card.dart';
// import 'package:shop/prod_detail.dart';
import 'package:shop/product_list.dart';




class HomePage extends StatefulWidget {
    const HomePage({super.key});
    

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const [ProdList() , CartList()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:currentPage ==0 ?const Text("Shoe Collection",
        style:TextStyle(
          fontFamily: "Lato",
          fontSize: 30,
          fontWeight: FontWeight.w200,
          color: Color.fromARGB(255, 0, 0, 0) 
          ), 
        ):const Text("Cart",
        style:TextStyle(
          fontFamily: "Lato",
          fontSize: 30,
          fontWeight: FontWeight.w200,
          color: Color.fromARGB(255, 0, 0, 0) 
          ), 
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
      items: const [
        BottomNavigationBarItem(
        
        icon: Icon(Icons.home,size: 37,),
        label: ''
        ),

        BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart,size: 37,),
        label: ''
        )
        ],
      ),
        body:currentPage == 0? pages[0]: pages[1], 
             
    );
  }
}
