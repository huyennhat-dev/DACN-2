import '/src/model/user.dart';

class Rate {
  String? sId;
  User? user;
  String? product;
  int? star;
  String? content;
  String? createdAt;
  String? updatedAt;

  Rate(
      {this.sId,
      this.user,
      this.product,
      this.star,
      this.content,
      this.createdAt,
      this.updatedAt});

  Rate.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    product = json['product'];
    star = json['star'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['product'] = product;
    data['star'] = star;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
