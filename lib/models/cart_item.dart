class CartItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGES = "images";
  static const PRODUCT_ID = "id";
  static const PRICE = "price";
  static const SIZE = "sizes";
  static const COLOR = "color";

  String _id;
  String _name;
  String _images;
  String _product_id;
  int _price;
  String _size;
  String _color;

  String get id => _id;
  String get name => _name;
  String get images => _images;
  String get product_id => _product_id;
  int get price => _price;
  String get size => _size;
  String get color => _color;

  CartItemModel.fromMap(Map data) {
    _name = data[NAME];
    _id = data[ID];
    _product_id = data[PRODUCT_ID];
    _price = data[PRICE];
    _size = data[SIZE];
    _color = data[COLOR];
  }

  Map toMap() => {
        ID: _id,
        IMAGES: _images,
        NAME: _name,
        PRODUCT_ID: _product_id,
        PRICE: _price,
        SIZE: _size,
        COLOR: _color,
      };
}
