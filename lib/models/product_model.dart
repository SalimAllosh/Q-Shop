// ignore_for_file: unnecessary_this, prefer_collection_literals

class Product {
  String? pId;
  String? oId;
  String? title;
  String? description;
  double? price;
  String? imageSrc;

  Product(
      {required this.pId,
      required this.oId,
      required this.title,
      required this.description,
      required this.price,
      required this.imageSrc});

  Product.fromJson(Map<String, dynamic> json) {
    pId = json['P_id'];
    oId = json['O_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imageSrc = json['imageSrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['P_id'] = this.pId;
    data['O_id'] = this.oId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['imageSrc'] = this.imageSrc;
    return data;
  }
}
