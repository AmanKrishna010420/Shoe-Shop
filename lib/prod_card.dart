import 'package:flutter/material.dart';


class ProdCard extends StatelessWidget {
  final String title ;
  final int price ;
  final String imageURL ;
  const ProdCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageURL,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        padding:const EdgeInsetsDirectional.only(top: 20),
        decoration: BoxDecoration(
          color:const Color.fromARGB(255, 250, 245, 245),
          borderRadius: BorderRadius.circular(23)
        ),
        child:Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),                
                child: Text(title,style: const TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
              )),
            const SizedBox(height: 5,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("$price \$",style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
              )),
            const SizedBox(height: 5,),
            Image.network(imageURL,height: 400,)
      
          ],
        ),
      ),
    );
  }
}