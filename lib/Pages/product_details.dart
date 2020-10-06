import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_flutter/Pages/Home.dart';
import 'package:shopapp_flutter/models/product.dart';

class ProductDetails extends StatefulWidget {
  final prod_detail_name;
  final prod_detail_price;
  final prod_brand;
  final prod_detail_picture;
  final prod_description;
  ProductDetails(
      {this.prod_detail_name,
      this.prod_brand,
      this.prod_detail_picture,
      this.prod_detail_price,
      this.prod_description});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text('Fashapp'),
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Image.network(
                    widget.prod_detail_picture,
                  ),
                ),
              ),
              footer: GridTile(
                child: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.prod_detail_name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.prod_brand,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "\$" + widget.prod_detail_price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              //First row of buttons
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Size'),
                            content: Text('Choose the size'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'close',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Size')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.white,
                  elevation: 0.2,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Color'),
                            content: Text('Choose the color'),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text(
                                  'Close',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Color')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Quantity'),
                            content: Text('Choose the quantity'),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text(
                                  'Close',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Qty')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //Second row of buttons
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {},
                  textColor: Colors.white,
                  child: Text('Buy Now'),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.red,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text(widget.prod_description),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  widget.prod_detail_name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  widget.prod_brand,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'NEW',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
            child: Text('Featured Products'),
          ),
          //Similar Products
          Container(
            height: 360.0,
            child: Similar_Products(),
          ),
        ],
      ),
    );
  }
}

class Similar_Products extends StatefulWidget {
  @override
  _Similar_ProductsState createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
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
//  ];
  List<Product> product = [];
  @override
  Widget build(BuildContext context) {
//    return GridView.builder(
//
//        itemCount: productList.length,
//        gridDelegate:
//            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//        itemBuilder: (BuildContext context, int index) {
//          return Similar_single_prod(
//            prod_Name: productList[index]['name'],
//            prod_picture: productList[index]['picture'],
//            prod_old_price: productList[index]['old price'],
//            prod_price: productList[index]['price'],
//          );
//        });
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('products')
          .where('featured', isEqualTo: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          return GridView.builder(
              itemCount: snapshot.data.docs.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, index) {
                var product = Product.fromSnapshot(snapshot.data.docs[index]);
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Similar_single_prod(
                    product: product,
                  ),
                );
              });
        }
      },
    );
  }
}

class Similar_single_prod extends StatelessWidget {
//  final prod_Name;
//  final prod_picture;
//  final prod_old_price;
//  final prod_price;
//  Similar_single_prod(
//      {this.prod_Name,
//      this.prod_old_price,
//      this.prod_picture,
//      this.prod_price});
  final Product product;
  Similar_single_prod({this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text('Hero 1'),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    prod_detail_name: product.name,
                    prod_brand: product.brand,
                    prod_detail_picture: product.images[0],
                    prod_detail_price: product.price.toString(),
                  ),
                ),
              );
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
