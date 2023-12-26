import '/src/model/rate.dart';

class Product {
  String? sId;
  String? name;
  List<String>? photos;
  String? author;
  int? price;
  int? quantity;
  int? purchases;
  double? sale;
  double? star;
  Categories? categories;
  String? description;
  List<Rate>? rates;

  Product(
      {this.sId,
      this.name,
      this.photos,
      this.author,
      this.price,
      this.quantity,
      this.purchases,
      this.sale,
      this.rates,
      this.categories,
      this.star,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photos = json['photos'].cast<String>();
    author = json['author'];
    price = json['price'];
    quantity = json['quantity'];
    categories = json['categories'];
    purchases = json['purchases'];
    sale = json['sale'];

    star = json['star'];
    rates = json['rates'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['photos'] = photos;
    data['author'] = author;
    data['price'] = price;
    data['quantity'] = quantity;
    data['purchases'] = purchases;
    data['sale'] = sale;
    data['categories'] = categories;
    data['star'] = star;
    data['rates'] = rates;
    data['description'] = description;
    return data;
  }
}

class Categories {
  String? sId;
  String? name;
  String? slug;

  Categories({this.sId, this.name, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
