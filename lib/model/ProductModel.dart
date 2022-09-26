/// id : 7
/// product_image : "Watch2.jpeg"
/// product_name : "watch"
/// price : "890"
/// description : "nice watch"

class ProductModel {
  ProductModel({
    dynamic id,
    dynamic productImage,
    dynamic productName,
    dynamic price,
    dynamic description,
  }) {
    _id = id;
    _productImage = productImage;
    _productName = productName;
    _price = price;
    _description = description;
  }
  static List<ProductModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => ProductModel.fromJson(value)).toList();
  }

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _productImage = json['product_image'];
    _productName = json['product_name'];
    _price = json['price'];
    _description = json['description'];
  }
  dynamic _id;
  dynamic _productImage;
  dynamic _productName;
  dynamic _price;
  dynamic _description;
  ProductModel copyWith({
    dynamic id,
    dynamic productImage,
    dynamic productName,
    dynamic price,
    dynamic description,
  }) =>
      ProductModel(
        id: id ?? _id,
        productImage: productImage ?? _productImage,
        productName: productName ?? _productName,
        price: price ?? _price,
        description: description ?? _description,
      );
  dynamic get id => _id;
  dynamic get productImage => _productImage;
  dynamic get productName => _productName;
  dynamic get price => _price;
  dynamic get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_image'] = _productImage;
    map['product_name'] = _productName;
    map['price'] = _price;
    map['description'] = _description;
    return map;
  }
}
