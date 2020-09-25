import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var cartProductList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 80,
      "size": 'M',
      'color': 'Black',
      'quantity': 1,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 85,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer2.jpeg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Dress",
      "picture": "images/products/dress2.jpeg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Heels",
      "picture": "images/products/hills2.jpeg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants2.jpg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Shoe",
      "picture": "images/products/shoe1.jpg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt2.jpg",
      "price": 80,
      "size": 'M',
      'color': 'Red',
      'quantity': 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartProductList.length,
        itemBuilder: (context, index) {
          return cart_Single_Prod(
            cart_prod_color: cartProductList[index]['color'],
            cart_prod_name: cartProductList[index]['name'],
            cart_prod_picture: cartProductList[index]['picture'],
            cart_prod_price: cartProductList[index]['price'],
            cart_prod_qty: cartProductList[index]['quantity'],
            cart_prod_size: cartProductList[index]['size'],
          );
        });
  }
}

class cart_Single_Prod extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;
  cart_Single_Prod(
      {this.cart_prod_color,
      this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_qty,
      this.cart_prod_size});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cart_prod_picture,
          height: 100.0,
          width: 100.0,
        ),
        //=========Title Section============
        title: Text(cart_prod_name),
        //===========Subtitle Section==========
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //=============Size section in the cart===============
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text('Size:'),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                //==============Color section in cart=====================
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text('Color:'),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    cart_prod_color,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '\$$cart_prod_price',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        //===========Trailing Section==================
        trailing: Column(
          children: <Widget>[
            Expanded(
              child: IconButton(
                onPressed: () {},
                padding: EdgeInsets.only(bottom: 0.0),
                icon: Icon(Icons.arrow_drop_up),
              ),
            ),
            Expanded(
              child: Text('$cart_prod_qty'),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_down),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
