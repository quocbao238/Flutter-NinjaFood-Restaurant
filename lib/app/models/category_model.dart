class CategoryModel {
  String? name;
  int? id;
  List<int>? productIds;
  String? image;

  String? sTypename;

  CategoryModel({this.name, this.id, this.productIds, this.sTypename,this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    productIds =
        json['productIds'] != null ? json['productIds'].cast<int>() : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['productIds'] = this.productIds;
    data['__typename'] = this.sTypename;
    return data;
  }

  CategoryModel copyWith({String? name, int? id, List<int>? productIds, String? image}) {
    return CategoryModel(
      name: name ?? this.name,
      id: id ?? this.id,
      productIds: productIds ?? this.productIds,
      image: image ?? this.image,
    );
  }
}
