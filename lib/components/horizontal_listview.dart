import 'package:flutter/material.dart';

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
          ),
          Categories(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: 'Shoes',
          ),
          Categories(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: 'Jeans',
          ),
          Categories(
            imageLocation: 'images/cats/informal.png',
            imageCaption: 'Informal',
          ),
          Categories(
            imageLocation: 'images/cats/formal.png',
            imageCaption: 'Formal',
          ),
          Categories(
            imageLocation: 'images/cats/dress.png',
            imageCaption: 'Dress',
          ),
          Categories(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: 'Accessories',
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  Categories({this.imageCaption, this.imageLocation});
  final String imageLocation;
  final String imageCaption;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
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
