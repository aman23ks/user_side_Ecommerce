import 'package:flutter/material.dart';
import 'package:shopapp_flutter/Pages/categories.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Categories(
              imageLocation: 'images/cats/tshirt.png',
              imageCaption: 'Shirt',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Category(
                              categoryName: "Shirt",
                            )));
              }),
          Categories(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: 'Shoes',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(
                            categoryName: "Shoes",
                          )));
            },
          ),
          Categories(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: 'Jeans',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(
                            categoryName: "Jeans",
                          )));
            },
          ),
          Categories(
            imageLocation: 'images/cats/informal.png',
            imageCaption: 'Informal',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Category(categoryName: "Informal")));
            },
          ),
          Categories(
            imageLocation: 'images/cats/formal.png',
            imageCaption: 'Formal',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(
                            categoryName: "Formal",
                          )));
            },
          ),
          Categories(
            imageLocation: 'images/cats/dress.png',
            imageCaption: 'Dress',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(
                            categoryName: "Dress",
                          )));
            },
          ),
          Categories(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: 'Accessories',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(
                            categoryName: "Accessories",
                          )));
            },
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  Categories({this.imageCaption, this.imageLocation, this.onTap});
  final String imageLocation;
  final String imageCaption;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 90,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imageCaption),
            ),
          ),
        ),
      ),
    );
  }
}
