import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_flutter/Pages/product_details.dart';
import 'package:shopapp_flutter/models/product.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
//  var productList = [
//    {
//      "name": "Blazer",
//      "picture": "images/products/blazer1.jpeg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Red Dress",
//      "picture": "images/products/dress1.jpeg",
//      "old price": "100",
//      "price": "85",
//    },
//    {
//      "name": "Blazer",
//      "picture": "images/products/blazer2.jpeg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Dress",
//      "picture": "images/products/dress2.jpeg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Heels",
//      "picture": "images/products/hills1.jpeg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Heels",
//      "picture": "images/products/hills2.jpeg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Pants",
//      "picture": "images/products/pants1.jpg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Pants",
//      "picture": "images/products/pants2.jpg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Shoe",
//      "picture": "images/products/shoe1.jpg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Skirt",
//      "picture": "images/products/skt1.jpg",
//      "old price": "120",
//      "price": "80",
//    },
//    {
//      "name": "Skirt",
//      "picture": "images/products/skt2.jpg",
//      "old price": "120",
//      "price": "80",
//    },
//  ];

  @override
  Widget build(BuildContext context) {
//    return GridView.builder(
//        itemCount: productList.length,
//        gridDelegate:
//            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//        itemBuilder: (BuildContext context, int index) {
//          return Single_prod(
//            prod_Name: productList[index]['name'],
//            prod_picture: productList[index]['picture'],
//            prod_old_price: productList[index]['old price'],
//            prod_price: productList[index]['price'],
//          );
//        });
//    return StreamBuilder<QuerySnapshot>(
//      stream: appProvider.loadProducts(),
//      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//        if (snapshot.hasData) {
//          snapshot.data.docs
//              .map((doc) => products.add(Product.fromSnapshot(doc)))
//              .toList();
//    appProvider
//        .loadProducts()
//        .data
//        .docs
//        .map((doc) => products.add(Product.fromSnapshot(doc)))
//        .toList();
//    return GridView.builder(
//        itemCount: products.length,
//        gridDelegate:
//            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//        itemBuilder: (BuildContext context, index) {
//          return Padding(
//            padding: EdgeInsets.all(8.0),
//            child: Single_prod(
//              product: products[index],
//            ),
//          );
//        });
//        }
//      },
//    );

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Container(),
            );
          }
          return GridView.builder(
            itemCount: snapshot.data.docs.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, index) {
              //List<Product> products = snapshot.data.docs.toList();
              var product = Product.fromSnapshot(snapshot.data.docs[index]);
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Single_prod(
                  product: product,
                ),
              );
            },
          );
        });
  }
}

class Single_prod extends StatelessWidget {
//  final prod_Name;
//  final prod_picture;
//  final prod_old_price;
//  final prod_price;
//  Single_prod(
//      {this.prod_Name,
//      this.prod_old_price,
//      this.prod_picture,
//      this.prod_price});
  final Product product;
  Single_prod({this.product});

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
                        prod_detail_name: product.name,
                        prod_brand: product.brand,
                        prod_detail_picture: product.images[0],
                        prod_detail_price: product.price.toString(),
                        prod_description: product.description,
                      )));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "\$" + product.price.toString(),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    product.brand,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              child: Image.network(
                product.images[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
