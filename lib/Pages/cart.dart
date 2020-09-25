import 'package:flutter/material.dart';
import 'package:shopapp_flutter/components/Cart_Products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: InkWell(
          onTap: () {},
          child: Text('Cart'),
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
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('\$230'),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.red,
                onPressed: () {},
                child: Text(
                  'Check Out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
