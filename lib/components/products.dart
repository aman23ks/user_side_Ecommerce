import 'package:flutter/material.dart';
import 'package:shopapp_flutter/Pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old price": "100",
      "price": "85",
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Dress",
      "picture": "images/products/dress2.jpeg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Heels",
      "picture": "images/products/hills2.jpeg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Pants",
      "picture": "images/products/pants2.jpg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Shoe",
      "picture": "images/products/shoe1.jpg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpg",
      "old price": "120",
      "price": "80",
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt2.jpg",
      "old price": "120",
      "price": "80",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_Name: productList[index]['name'],
            prod_picture: productList[index]['picture'],
            prod_old_price: productList[index]['old price'],
            prod_price: productList[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_Name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  Single_prod(
      {this.prod_Name,
      this.prod_old_price,
      this.prod_picture,
      this.prod_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text('Hero 1'),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        prod_detail_name: prod_Name,
                        prod_detail_old_price: prod_old_price,
                        prod_detail_picture: prod_picture,
                        prod_detail_price: prod_price,
                      )));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    prod_Name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "\$" + prod_price,
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    "\$" + prod_old_price,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
