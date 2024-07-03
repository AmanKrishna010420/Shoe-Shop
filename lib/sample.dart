import 'package:flutter/material.dart';
import 'package:shop/list_products.dart';
import 'package:shop/prod_card.dart';
import 'package:shop/prod_detail.dart';

class ProdList extends StatefulWidget {
  const ProdList({super.key});

  @override
  State<ProdList> createState() => _ProdListState();
}

class _ProdListState extends State<ProdList> {
  TextEditingController textEditingController =  TextEditingController();
  final List<String> filter = const  ["All", "Adidas", "Nike", "Others"];
  

  late String selectedfilter;
  @override
  void initState() {
    selectedfilter = filter[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBar(
              controller: textEditingController,
              hintText: "Search",              
              leading: const Icon(Icons.search),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index) {
              final filters = filter[index];
              return  Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 12),
                child:  GestureDetector(
                  onTap: () {
                    setState(() {
                    selectedfilter = filters ;
                    });
                  },
                  child: Chip(
                    shape:  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                    backgroundColor: selectedfilter == filters ?Colors.amber : const  Color.fromARGB(255, 246, 244, 240),
                    padding: const  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    label: Text(
                    filters,
                    style: const TextStyle(fontSize:16),
                    )
                  ),
                ),
              );
            } ),
          ),
          //itemcards
          Expanded(
          
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
              final product = products[index];  
              // Handle potential null values in the product
              final name = product["name"] ?? "No Name";
              final  price = product["price"] ?? 0;
              final  imageURL = product["imageURL"] ?? "";
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ProdDetail(product: product);
                  },));
                },
                child: ProdCard(
                  title:name  as String , 
                  price: price as int , 
                  imageURL:imageURL as String,),
              );
            },),
          )
        ],);
  }
}