import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_flutter/Pages/cart.dart';
import 'package:shopapp_flutter/Pages/product_details.dart';
import 'package:shopapp_flutter/models/product.dart';

class Category extends StatefulWidget {
  final Product product;
  final String categoryName;

  const Category({Key key, this.product, this.categoryName}) : super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Material(
          borderRadius: BorderRadius.circular(32.0),
          color: Colors.red,
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "The search field cannot be empty";
                }
                return null;
              },
            ),
          ),
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
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('category', isEqualTo: widget.categoryName)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return GridView.builder(
                itemCount: snapshot.data.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, index) {
                  var product = Product.fromSnapshot(snapshot.data.docs[index]);
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Single_prod(
                      product: product,
                    ),
                  );
                });
          }
        },
      ),
    );
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
//                        prod_detail_name: product.name,
//                        prod_brand: product.brand,
//                        prod_detail_picture: product.images[0],
//                        prod_detail_price: product.price.toString(),
//                        prod_description: product.description,
//                        prod_sizes: product.sizes.toList(),
//                        prod_quantity: product.quantity.toString(),
//                        prod_sale: product.sale,
                        product: product,
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
//                  trailing: Text(
//                    product.sale ? "Sale" : "",
//                  ),
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
