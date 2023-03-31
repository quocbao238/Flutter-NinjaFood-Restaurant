
class ProductModel {
  String? name;
  int? id;
  String? uid;
  Image? image;
  SmallImage? smallImage;
  List<MediaGallery>? mediaGallery;
  String? sTypename;
  PriceRange? priceRange;
  Description? description;
  Description? shortDescription;

  ProductModel(
      {this.name,
        this.id,
        this.uid,
        this.image,
        this.smallImage,
        this.mediaGallery,
        this.sTypename,
        this.priceRange,
        this.description,
        this.shortDescription});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    uid = json['uid'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    smallImage = json['small_image'] != null
        ? new SmallImage.fromJson(json['small_image'])
        : null;
    if (json['media_gallery'] != null) {
      mediaGallery = <MediaGallery>[];
      json['media_gallery'].forEach((v) {
        mediaGallery!.add(new MediaGallery.fromJson(v));
      });
    }
    sTypename = json['__typename'];
    priceRange = json['price_range'] != null
        ? new PriceRange.fromJson(json['price_range'])
        : null;
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    shortDescription = json['short_description'] != null
        ? new Description.fromJson(json['short_description'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['uid'] = this.uid;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.smallImage != null) {
      data['small_image'] = this.smallImage!.toJson();
    }
    if (this.mediaGallery != null) {
      data['media_gallery'] =
          this.mediaGallery!.map((v) => v.toJson()).toList();
    }
    data['__typename'] = this.sTypename;
    if (this.priceRange != null) {
      data['price_range'] = this.priceRange!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.shortDescription != null) {
      data['short_description'] = this.shortDescription!.toJson();
    }
    return data;
  }
}

class Image {
  String? label;
  String? url;
  Null? position;
  String? sTypename;

  Image({this.label, this.url, this.position, this.sTypename});

  Image.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    url = json['url'];
    position = json['position'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['url'] = this.url;
    data['position'] = this.position;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class SmallImage {
  Null? disabled;
  String? label;
  Null? position;
  String? url;
  String? sTypename;

  SmallImage(
      {this.disabled, this.label, this.position, this.url, this.sTypename});

  SmallImage.fromJson(Map<String, dynamic> json) {
    disabled = json['disabled'];
    label = json['label'];
    position = json['position'];
    url = json['url'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disabled'] = this.disabled;
    data['label'] = this.label;
    data['position'] = this.position;
    data['url'] = this.url;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class MediaGallery {
  String? url;
  Null? label;
  int? position;
  String? sTypename;

  MediaGallery({this.url, this.label, this.position, this.sTypename});

  MediaGallery.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    position = json['position'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['position'] = this.position;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class PriceRange {
  MinimumPrice? minimumPrice;
  String? sTypename;

  PriceRange({this.minimumPrice, this.sTypename});

  PriceRange.fromJson(Map<String, dynamic> json) {
    minimumPrice = json['minimum_price'] != null
        ? new MinimumPrice.fromJson(json['minimum_price'])
        : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.minimumPrice != null) {
      data['minimum_price'] = this.minimumPrice!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class MinimumPrice {
  FinalPrice? finalPrice;
  String? sTypename;

  MinimumPrice({this.finalPrice, this.sTypename});

  MinimumPrice.fromJson(Map<String, dynamic> json) {
    finalPrice = json['final_price'] != null
        ? new FinalPrice.fromJson(json['final_price'])
        : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.finalPrice != null) {
      data['final_price'] = this.finalPrice!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class FinalPrice {
  String? currency;
  int? value;
  String? sTypename;

  FinalPrice({this.currency, this.value, this.sTypename});

  FinalPrice.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    value = json['value'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['value'] = this.value;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class Description {
  String? html;
  String? sTypename;

  Description({this.html, this.sTypename});

  Description.fromJson(Map<String, dynamic> json) {
    html = json['html'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['html'] = this.html;
    data['__typename'] = this.sTypename;
    return data;
  }
}



//
// // Demo Json
// var productListJson = {
//   "products": [
//     {
//       "name": "Nạc Vai & Mông Bò Angus 600gr",
//       "id": 3946,
//       "uid": "Mzk0Ng==",
//       "image": {
//         "label": "Nạc Vai & Mông Bò Angus 600gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_600gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Vai & Mông Bò Angus 600gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_600gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_600gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 829000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Vai & Nạc Lưng Bò Angus 600gr",
//       "id": 3945,
//       "uid": "Mzk0NQ==",
//       "image": {
//         "label": "Nạc Vai & Nạc Lưng Bò Angus 600gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_600gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Vai & Nạc Lưng Bò Angus 600gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_600gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_600gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 1079000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Non Bò Mỹ Sốt Obathan",
//       "id": 3808,
//       "uid": "MzgwOA==",
//       "image": {
//         "label": "Sườn Non Bò Mỹ Sốt Obathan",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Non Bò Mỹ Sốt Obathan",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 419000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Vai & Thăn Ngoại Bò Angus 600gr",
//       "id": 3944,
//       "uid": "Mzk0NA==",
//       "image": {
//         "label": "Nạc Vai & Thăn Ngoại Bò Angus 600gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_600gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Vai & Thăn Ngoại Bò Angus 600gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_600gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_600gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 969000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lõi Vai & Mông Bò Angus 600gr",
//       "id": 3943,
//       "uid": "Mzk0Mw==",
//       "image": {
//         "label": "Lõi Vai & Mông Bò Angus 600gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_600gr_1_.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lõi Vai & Mông Bò Angus 600gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_600gr_1_.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_600gr_1_.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 829000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lõi Vai & Nạc Lưng Bò Angus 600gr",
//       "id": 3942,
//       "uid": "Mzk0Mg==",
//       "image": {
//         "label": "Lõi Vai & Nạc Lưng Bò Angus 600gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_600gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lõi Vai & Nạc Lưng Bò Angus 600gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_600gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_600gr.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 1079000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lõi Vai & Thăn Ngoại Bò Angus 600gr",
//       "id": 3941,
//       "uid": "Mzk0MQ==",
//       "image": {
//         "label": "Lõi Vai & Thăn Ngoại Bò Angus 600gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_600gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lõi Vai & Thăn Ngoại Bò Angus 600gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_600gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_600gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 969000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Vai & Mông Bò Angus 300gr",
//       "id": 3940,
//       "uid": "Mzk0MA==",
//       "image": {
//         "label": "Nạc Vai & Mông Bò Angus 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_300gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Vai & Mông Bò Angus 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_300gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_300gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 429000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Thăn Nội Bò Mỹ 600gr",
//       "id": 3795,
//       "uid": "Mzc5NQ==",
//       "image": {
//         "label": "Thăn Nội Bò Mỹ 600gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_noi_bo_my_600gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Thăn Nội Bò Mỹ 600gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_noi_bo_my_600gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_noi_bo_my_600gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 749000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Vai & Nạc Lưng bò Angus 300gr",
//       "id": 3939,
//       "uid": "MzkzOQ==",
//       "image": {
//         "label": "Nạc Vai & Nạc Lưng bò Angus 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_300gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Vai & Nạc Lưng bò Angus 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_300gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_300gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 599000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn LA Galbi 300g + Sườn Hoàng Đế",
//       "id": 3803,
//       "uid": "MzgwMw==",
//       "image": {
//         "label": "Sườn LA Galbi 300g + Sườn Hoàng Đế",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_suon_hoang_de.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn LA Galbi 300g + Sườn Hoàng Đế",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_suon_hoang_de.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_suon_hoang_de.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 749000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Vai & Thăn Ngoại Bò Angus 300gr",
//       "id": 3938,
//       "uid": "MzkzOA==",
//       "image": {
//         "label": "Nạc Vai & Thăn Ngoại Bò Angus 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_300gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Vai & Thăn Ngoại Bò Angus 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_300gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_300gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 489000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn LA Galbi 300g + Sườn Bò LA Galbi",
//       "id": 3804,
//       "uid": "MzgwNA==",
//       "image": {
//         "label": "Sườn LA Galbi 300g + Sườn Bò LA Galbi",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_than_noi_bo_my.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn LA Galbi 300g + Sườn Bò LA Galbi",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_than_noi_bo_my.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_than_noi_bo_my.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 749000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Non Bò Mỹ LA Sốt Galbi 150gr",
//       "id": 3801,
//       "uid": "MzgwMQ==",
//       "image": {
//         "label": "Sườn Non Bò Mỹ LA Sốt Galbi 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_la_galbi_600gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Non Bò Mỹ LA Sốt Galbi 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_la_galbi_600gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_la_galbi_600gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 239000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lõi Vai & Mông Bò Angus 300gr",
//       "id": 3937,
//       "uid": "MzkzNw==",
//       "image": {
//         "label": "Lõi Vai & Mông Bò Angus 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_300gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lõi Vai & Mông Bò Angus 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_300gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_300gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 429000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn non Bò mỹ bỏ xương 600gr",
//       "id": 3806,
//       "uid": "MzgwNg==",
//       "image": {
//         "label": "Sườn non Bò mỹ bỏ xương 600gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_bo_xuong.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn non Bò mỹ bỏ xương 600gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_bo_xuong.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_bo_xuong.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 749000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Non Bò Mỹ Sốt Obathan 300gr",
//       "id": 3800,
//       "uid": "MzgwMA==",
//       "image": {
//         "label": "Sườn Non Bò Mỹ Sốt Obathan 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_sot_obathan.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Non Bò Mỹ Sốt Obathan 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_sot_obathan.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_sot_obathan.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 359000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lõi Vai & Nạc Lưng Bò Angus 300gr",
//       "id": 3936,
//       "uid": "MzkzNg==",
//       "image": {
//         "label": "Lõi Vai & Nạc Lưng Bò Angus 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_300gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lõi Vai & Nạc Lưng Bò Angus 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_300gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_300gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 589000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Tiết Kiệm 2",
//       "id": 3925,
//       "uid": "MzkyNQ==",
//       "image": {
//         "label": "Combo Tiết Kiệm 2",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Tiết Kiệm 2",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 649000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Non Bò Mỹ Hảo Hạng Tươi 150gr",
//       "id": 3799,
//       "uid": "Mzc5OQ==",
//       "image": {
//         "label": "Sườn Non Bò Mỹ Hảo Hạng Tươi 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_hao_hang_tuoi.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Non Bò Mỹ Hảo Hạng Tươi 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_hao_hang_tuoi.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_hao_hang_tuoi.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 349000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lõi Vai & Thăn Ngoại Bò Angus 300gr",
//       "id": 3935,
//       "uid": "MzkzNQ==",
//       "image": {
//         "label": "Lõi Vai & Thăn Ngoại Bò Angus 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_300gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lõi Vai & Thăn Ngoại Bò Angus 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_300gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_300gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 499000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Tiết Kiệm 1",
//       "id": 3924,
//       "uid": "MzkyNA==",
//       "image": {
//         "label": "Combo Tiết Kiệm 1",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Tiết Kiệm 1",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 649000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Non Bò Mỹ Hảo Hạng Sốt Obathan",
//       "id": 3798,
//       "uid": "Mzc5OA==",
//       "image": {
//         "label": "Sườn Non Bò Mỹ Hảo Hạng Sốt Obathan",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_my_hao_hang_sot_obanthan.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Non Bò Mỹ Hảo Hạng Sốt Obathan",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_my_hao_hang_sot_obanthan.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_my_hao_hang_sot_obanthan.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 349000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (lớn)",
//       "id": 3934,
//       "uid": "MzkzNA==",
//       "image": {
//         "label": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (lớn)",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_lon.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (lớn)",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_lon.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_lon.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 969000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Dẻ Sườn Bò Mỹ Sốt Mật Ong 150gr",
//       "id": 3797,
//       "uid": "Mzc5Nw==",
//       "image": {
//         "label": "Dẻ Sườn Bò Mỹ Sốt Mật Ong 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_tuoi_mat_ong.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Dẻ Sườn Bò Mỹ Sốt Mật Ong 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_tuoi_mat_ong.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_tuoi_mat_ong.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 229000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (nhỏ)",
//       "id": 3933,
//       "uid": "MzkzMw==",
//       "image": {
//         "label": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (nhỏ)",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_nho.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (nhỏ)",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_nho.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_nho.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 489000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Thăn Nội Bò Mỹ + Sườn Hoàng Đế",
//       "id": 3922,
//       "uid": "MzkyMg==",
//       "image": {
//         "label": "Combo Thăn Nội Bò Mỹ + Sườn Hoàng Đế",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_hoang_de.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Thăn Nội Bò Mỹ + Sườn Hoàng Đế",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_hoang_de.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_hoang_de.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 769000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Dẻ Sườn Bò Mỹ Sốt Obathan 150gr",
//       "id": 3796,
//       "uid": "Mzc5Ng==",
//       "image": {
//         "label": "Dẻ Sườn Bò Mỹ Sốt Obathan 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Dẻ Sườn Bò Mỹ Sốt Obathan 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 229000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (lớn)",
//       "id": 3932,
//       "uid": "MzkzMg==",
//       "image": {
//         "label": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (lớn)",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_lon.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (lớn)",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_lon.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_lon.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 1029000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Sườn Hoàng Đế + Sườn Bò Mỹ Bỏ Xương",
//       "id": 3921,
//       "uid": "MzkyMQ==",
//       "image": {
//         "label": "Combo Sườn Hoàng Đế + Sườn Bò Mỹ Bỏ Xương",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_suon_hoang_de_suon_bo_my_bo_xuong.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Sườn Hoàng Đế + Sườn Bò Mỹ Bỏ Xương",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_suon_hoang_de_suon_bo_my_bo_xuong.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_suon_hoang_de_suon_bo_my_bo_xuong.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 749000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (nhỏ)",
//       "id": 3931,
//       "uid": "MzkzMQ==",
//       "image": {
//         "label": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (nhỏ)",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_nho.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (nhỏ)",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_nho.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_nho.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 519000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo Thăn Nội Bò Mỹ + Sườn Bò Mỹ",
//       "id": 3920,
//       "uid": "MzkyMA==",
//       "image": {
//         "label": "Combo Thăn Nội Bò Mỹ + Sườn Bò Mỹ",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_bo_my.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo Thăn Nội Bò Mỹ + Sườn Bò Mỹ",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_bo_my.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_bo_my.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 749000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Thăn Ngoại Bò STRIPLOIN ANGUS",
//       "id": 3794,
//       "uid": "Mzc5NA==",
//       "image": {
//         "label": "Thăn Ngoại Bò STRIPLOIN ANGUS",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than-ngoai-bo-strip.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Thăn Ngoại Bò STRIPLOIN ANGUS",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than-ngoai-bo-strip.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than-ngoai-bo-strip.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 269000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Vai Bò Mát Nhập Khẩu",
//       "id": 3930,
//       "uid": "MzkzMA==",
//       "image": {
//         "label": "Nạc Vai Bò Mát Nhập Khẩu",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_bo_mat_nhap_khau.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Vai Bò Mát Nhập Khẩu",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_bo_mat_nhap_khau.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_bo_mat_nhap_khau.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 169000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc vai heo ủ sốt tương đậu",
//       "id": 3820,
//       "uid": "MzgyMA==",
//       "image": {
//         "label": "Nạc vai heo ủ sốt tương đậu",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-vai-heo-tuong-daualc_3.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc vai heo ủ sốt tương đậu",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-vai-heo-tuong-daualc_3.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-vai-heo-tuong-daualc_3.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Lưng Bò RIBEYE ANGUS",
//       "id": 3793,
//       "uid": "Mzc5Mw==",
//       "image": {
//         "label": "Nạc Lưng Bò RIBEYE ANGUS",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-lung-bo-ribeye.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Lưng Bò RIBEYE ANGUS",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-lung-bo-ribeye.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-lung-bo-ribeye.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 279000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lõi Vai Bò Mát Nhập Khẩu",
//       "id": 3929,
//       "uid": "MzkyOQ==",
//       "image": {
//         "label": "Lõi Vai Bò Mát Nhập Khẩu",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_bo_mat_nhap_khau.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lõi Vai Bò Mát Nhập Khẩu",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_bo_mat_nhap_khau.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_bo_mat_nhap_khau.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 179000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Ba Chỉ Heo Mỹ Sốt Ủ Tương Đậu",
//       "id": 3812,
//       "uid": "MzgxMg==",
//       "image": {
//         "label": "Ba Chỉ Heo Mỹ Sốt Ủ Tương Đậu",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/ba-chi-heo-sot-tuong-dau.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Ba Chỉ Heo Mỹ Sốt Ủ Tương Đậu",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/ba-chi-heo-sot-tuong-dau.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/ba-chi-heo-sot-tuong-dau.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Mông Bò Angus",
//       "id": 3792,
//       "uid": "Mzc5Mg==",
//       "image": {
//         "label": "Mông Bò Angus",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong-bo-angus.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Mông Bò Angus",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong-bo-angus.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong-bo-angus.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 219000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Mông Bò Mát Nhập Khẩu",
//       "id": 3928,
//       "uid": "MzkyOA==",
//       "image": {
//         "label": "Mông Bò Mát Nhập Khẩu",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong_bo_mat_nhap_khau.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Mông Bò Mát Nhập Khẩu",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong_bo_mat_nhap_khau.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong_bo_mat_nhap_khau.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 219000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Sụn Heo Sốt Galbi 150gr",
//       "id": 3811,
//       "uid": "MzgxMQ==",
//       "image": {
//         "label": "Sườn Sụn Heo Sốt Galbi 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Sụn Heo Sốt Galbi 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 159000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lõi Vai Oyster Blade",
//       "id": 3791,
//       "uid": "Mzc5MQ==",
//       "image": {
//         "label": "Lõi Vai Oyster Blade",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-loi-vai-oyster-blade.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lõi Vai Oyster Blade",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-loi-vai-oyster-blade.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-loi-vai-oyster-blade.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 199000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Lưng Bò Mát Nhập Khẩu",
//       "id": 3927,
//       "uid": "MzkyNw==",
//       "image": {
//         "label": "Nạc Lưng Bò Mát Nhập Khẩu",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_lung_bo_mat_nhap_khau.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Lưng Bò Mát Nhập Khẩu",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_lung_bo_mat_nhap_khau.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_lung_bo_mat_nhap_khau.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 279000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Heo Mỹ Sốt Obathan 300gr",
//       "id": 3810,
//       "uid": "MzgxMA==",
//       "image": {
//         "label": "Sườn Heo Mỹ Sốt Obathan 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_obathan.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Heo Mỹ Sốt Obathan 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_obathan.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_obathan.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 159000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc Vai Top Blade",
//       "id": 3790,
//       "uid": "Mzc5MA==",
//       "image": {
//         "label": "Nạc Vai Top Blade",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-nac-vai-top-blade.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc Vai Top Blade",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-nac-vai-top-blade.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-nac-vai-top-blade.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 189000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Cơm Trộn Bạch Tuộc",
//       "id": 4059,
//       "uid": "NDA1OQ==",
//       "image": {
//         "label": "Cơm Trộn Bạch Tuộc",
//         "url": "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/image.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Cơm Trộn Bạch Tuộc",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Thăn Ngoại Bò Mát Nhập Khẩu",
//       "id": 3926,
//       "uid": "MzkyNg==",
//       "image": {
//         "label": "Thăn Ngoại Bò Mát Nhập Khẩu",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_ngoai_bo_mat_nhap_khau.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Thăn Ngoại Bò Mát Nhập Khẩu",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_ngoai_bo_mat_nhap_khau.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_ngoai_bo_mat_nhap_khau.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 269000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Heo Mỹ Sốt Galbi 300gr",
//       "id": 3809,
//       "uid": "MzgwOQ==",
//       "image": {
//         "label": "Sườn Heo Mỹ Sốt Galbi 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Heo Mỹ Sốt Galbi 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 159000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn Bò Tomahawk 700gr",
//       "id": 3789,
//       "uid": "Mzc4OQ==",
//       "image": {
//         "label": "Sườn Bò Tomahawk 700gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_tomahawk_700gr.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn Bò Tomahawk 700gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_tomahawk_700gr.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_tomahawk_700gr.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 1990000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Khăn Lạnh Golden Gate",
//       "id": 3980,
//       "uid": "Mzk4MA==",
//       "image": {
//         "label": "Khăn Lạnh Golden Gate",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/h/khan_lanh_golden_gate.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Khăn Lạnh Golden Gate",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/h/khan_lanh_golden_gate.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/h/khan_lanh_golden_gate.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 5000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Canh Thịt Bò Bulgogi ALC",
//       "id": 3834,
//       "uid": "MzgzNA==",
//       "image": {
//         "label": "Canh Thịt Bò Bulgogi ALC",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-thit-bo-bulgogi-new.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Canh Thịt Bò Bulgogi ALC",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-thit-bo-bulgogi-new.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-thit-bo-bulgogi-new.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Bạch Tuộc Đại Dương Sốt Cay Đặc Biệt",
//       "id": 3831,
//       "uid": "MzgzMQ==",
//       "image": {
//         "label": "Bạch Tuộc Đại Dương Sốt Cay Đặc Biệt",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-dai-duong-sot-cay-dac-biet.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Bạch Tuộc Đại Dương Sốt Cay Đặc Biệt",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-dai-duong-sot-cay-dac-biet.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-dai-duong-sot-cay-dac-biet.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 229000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Bạch Tuộc Sốt Cay",
//       "id": 3829,
//       "uid": "MzgyOQ==",
//       "image": {
//         "label": "Bạch Tuộc Sốt Cay",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuot-sot-cay.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Bạch Tuộc Sốt Cay",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuot-sot-cay.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuot-sot-cay.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 109000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Salad Củ Sen",
//       "id": 3825,
//       "uid": "MzgyNQ==",
//       "image": {
//         "label": "Salad Củ Sen",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-cu-sen-new.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Salad Củ Sen",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-cu-sen-new.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-cu-sen-new.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 98000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nấm Tiên",
//       "id": 3823,
//       "uid": "MzgyMw==",
//       "image": {
//         "label": "Nấm Tiên",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-tien-new_1_1_.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nấm Tiên",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-tien-new_1_1_.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-tien-new_1_1_.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 22000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lẩu Cay Hải Sản",
//       "id": 3821,
//       "uid": "MzgyMQ==",
//       "image": {
//         "label": "Lẩu Cay Hải Sản",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/a/lau-cay-hai-san.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lẩu Cay Hải Sản",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/a/lau-cay-hai-san.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/a/lau-cay-hai-san.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 319000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Má heo mỹ tươi 150gr",
//       "id": 586,
//       "uid": "NTg2",
//       "image": {
//         "label": "Má heo mỹ tươi 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2868_ma_heo_my_tuoi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Má heo mỹ tươi 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2868_ma_heo_my_tuoi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2868_ma_heo_my_tuoi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2868_ma_heo_my_tuoi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2868_ma_heo_my_tuoi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 129000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc vai heo sốt obathan 150gr",
//       "id": 582,
//       "uid": "NTgy",
//       "image": {
//         "label": "Nạc vai heo sốt obathan 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2864_Nac_vai_heo_sot_Obathan_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc vai heo sốt obathan 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2864_Nac_vai_heo_sot_Obathan_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2864_Nac_vai_heo_sot_Obathan_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2864_Nac_vai_heo_sot_Obathan_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2864_Nac_vai_heo_sot_Obathan_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nạc vai heo sốt galbi 150gr",
//       "id": 581,
//       "uid": "NTgx",
//       "image": {
//         "label": "Nạc vai heo sốt galbi 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2863_Nac_Vai_heo_sot_Galbi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nạc vai heo sốt galbi 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2863_Nac_Vai_heo_sot_Galbi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2863_Nac_Vai_heo_sot_Galbi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2863_Nac_Vai_heo_sot_Galbi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2863_Nac_Vai_heo_sot_Galbi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Ba chỉ heo mỹ sốt obathan 150gr",
//       "id": 580,
//       "uid": "NTgw",
//       "image": {
//         "label": "Ba chỉ heo mỹ sốt obathan 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2862_Ba_Chi_Heo_My_Sot_Obathan_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Ba chỉ heo mỹ sốt obathan 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2862_Ba_Chi_Heo_My_Sot_Obathan_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2862_Ba_Chi_Heo_My_Sot_Obathan_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2862_Ba_Chi_Heo_My_Sot_Obathan_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2862_Ba_Chi_Heo_My_Sot_Obathan_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Ba chỉ heo mỹ tươi 150gr",
//       "id": 579,
//       "uid": "NTc5",
//       "image": {
//         "label": "Ba chỉ heo mỹ tươi 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2861_Ba_chi_heo_my_tuoi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Ba chỉ heo mỹ tươi 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2861_Ba_chi_heo_my_tuoi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2861_Ba_chi_heo_my_tuoi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2861_Ba_chi_heo_my_tuoi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2861_Ba_chi_heo_my_tuoi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Má heo mỹ sốt obathan",
//       "id": 578,
//       "uid": "NTc4",
//       "image": {
//         "label": "Má heo mỹ sốt obathan",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2417_ma_heo_my_sot_obathan_1_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Má heo mỹ sốt obathan",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2417_ma_heo_my_sot_obathan_3_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2417_ma_heo_my_sot_obathan_1_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2417_ma_heo_my_sot_obathan_2_1.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2417_ma_heo_my_sot_obathan_3_1.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 129000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn sụn heo sốt obathan",
//       "id": 577,
//       "uid": "NTc3",
//       "image": {
//         "label": "Sườn sụn heo sốt obathan",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2416_Suon_sun_heo_sot_Obathan_1_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn sụn heo sốt obathan",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2416_Suon_sun_heo_sot_Obathan_3_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2416_Suon_sun_heo_sot_Obathan_1_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2416_Suon_sun_heo_sot_Obathan_2_1.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2416_Suon_sun_heo_sot_Obathan_3_1.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 149000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Ba chỉ bò mỹ sốt obathan",
//       "id": 566,
//       "uid": "NTY2",
//       "image": {
//         "label": "Ba chỉ bò mỹ sốt obathan",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/ba_chi_bo_my_sot_obathan.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Ba chỉ bò mỹ sốt obathan",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/ba_chi_bo_my_sot_obathan.jpg",
//           "label": null,
//           "position": 4,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 139000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Gầu bò mỹ sốt obathan",
//       "id": 565,
//       "uid": "NTY1",
//       "image": {
//         "label": "Gầu bò mỹ sốt obathan",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4880_Gau_bo_my_sot_obathan_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Gầu bò mỹ sốt obathan",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4880_Gau_bo_my_sot_obathan_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4880_Gau_bo_my_sot_obathan_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4880_Gau_bo_my_sot_obathan_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4880_Gau_bo_my_sot_obathan_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 139000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn non bò mỹ sốt galbi 300gr",
//       "id": 564,
//       "uid": "NTY0",
//       "image": {
//         "label": "Sườn non bò mỹ sốt galbi 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2857_Suon_non_bo_My_sot_Galbi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn non bò mỹ sốt galbi 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2857_Suon_non_bo_My_sot_Galbi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2857_Suon_non_bo_My_sot_Galbi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2857_Suon_non_bo_My_sot_Galbi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2857_Suon_non_bo_My_sot_Galbi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 449000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn non bò mỹ LA sốt Obathan 150gr",
//       "id": 563,
//       "uid": "NTYz",
//       "image": {
//         "label": "Sườn non bò mỹ LA sốt Obathan 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_la_sot_obathan.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn non bò mỹ LA sốt Obathan 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_la_sot_obathan.jpg",
//           "label": null,
//           "position": 4,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 239000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Dẻ sườn hoàng đế tươi 150gr",
//       "id": 562,
//       "uid": "NTYy",
//       "image": {
//         "label": "Dẻ sườn hoàng đế tươi 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_hoang_de_tuoi.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Dẻ sườn hoàng đế tươi 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_hoang_de_tuoi.jpg",
//           "label": null,
//           "position": 4,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 239000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Diềm bụng bò mỹ tươi 150gr",
//       "id": 561,
//       "uid": "NTYx",
//       "image": {
//         "label": "Diềm bụng bò mỹ tươi 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2851_Diem_bung_bo_My_tuoi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Diềm bụng bò mỹ tươi 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2851_Diem_bung_bo_My_tuoi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2851_Diem_bung_bo_My_tuoi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2851_Diem_bung_bo_My_tuoi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2851_Diem_bung_bo_My_tuoi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 329000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Ba chỉ bò mỹ sốt mật ong 150gr",
//       "id": 560,
//       "uid": "NTYw",
//       "image": {
//         "label": "Ba chỉ bò mỹ sốt mật ong 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2850_ba_chi_bo_my_sot_mat_ong_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Ba chỉ bò mỹ sốt mật ong 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2850_ba_chi_bo_my_sot_mat_ong_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2850_ba_chi_bo_my_sot_mat_ong_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2850_ba_chi_bo_my_sot_mat_ong_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2850_ba_chi_bo_my_sot_mat_ong_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 139000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Gầu bò mỹ sốt mật ong 150gr",
//       "id": 559,
//       "uid": "NTU5",
//       "image": {
//         "label": "Gầu bò mỹ sốt mật ong 150gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2849_gau_bo_my_sot_mat_ong_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Gầu bò mỹ sốt mật ong 150gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2849_gau_bo_my_sot_mat_ong_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2849_gau_bo_my_sot_mat_ong_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2849_gau_bo_my_sot_mat_ong_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2849_gau_bo_my_sot_mat_ong_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 129000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn non Bò mỹ tươi (300g)",
//       "id": 558,
//       "uid": "NTU4",
//       "image": {
//         "label": "Sườn non Bò mỹ tươi (300g)",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2795_Suon_non_bo_My_tuoi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn non Bò mỹ tươi (300g)",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2795_Suon_non_bo_My_tuoi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2795_Suon_non_bo_My_tuoi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2795_Suon_non_bo_My_tuoi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2795_Suon_non_bo_My_tuoi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 429000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Diềm bụng bò mỹ sốt Obathan",
//       "id": 557,
//       "uid": "NTU3",
//       "image": {
//         "label": "Diềm bụng bò mỹ sốt Obathan",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2426_Diem_bung_bo_My_sot_Obathan_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Diềm bụng bò mỹ sốt Obathan",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2426_Diem_bung_bo_My_sot_Obathan_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2426_Diem_bung_bo_My_sot_Obathan_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2426_Diem_bung_bo_My_sot_Obathan_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2426_Diem_bung_bo_My_sot_Obathan_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 329000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn đế vương sốt galbi",
//       "id": 556,
//       "uid": "NTU2",
//       "image": {
//         "label": "Sườn đế vương sốt galbi",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2415_Suon_de_vuong_sot_Galbi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn đế vương sốt galbi",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2415_Suon_de_vuong_sot_Galbi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2415_Suon_de_vuong_sot_Galbi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2415_Suon_de_vuong_sot_Galbi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2415_Suon_de_vuong_sot_Galbi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 599000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Dẻ sườn hoàng đế sốt galbi",
//       "id": 555,
//       "uid": "NTU1",
//       "image": {
//         "label": "Dẻ sườn hoàng đế sốt galbi",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2413_De_suon_hoang_de_sot_Galbi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Dẻ sườn hoàng đế sốt galbi",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2413_De_suon_hoang_de_sot_Galbi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2413_De_suon_hoang_de_sot_Galbi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2413_De_suon_hoang_de_sot_Galbi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2413_De_suon_hoang_de_sot_Galbi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 239000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Dẻ sườn hoàng đế sốt obathan",
//       "id": 554,
//       "uid": "NTU0",
//       "image": {
//         "label": "Dẻ sườn hoàng đế sốt obathan",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2412_De_suon_hoang_de_sot_obathan_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Dẻ sườn hoàng đế sốt obathan",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2412_De_suon_hoang_de_sot_obathan_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2412_De_suon_hoang_de_sot_obathan_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2412_De_suon_hoang_de_sot_obathan_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2412_De_suon_hoang_de_sot_obathan_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 239000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Sườn đế vương sốt mật ong 500gr",
//       "id": 553,
//       "uid": "NTUz",
//       "image": {
//         "label": "Sườn đế vương sốt mật ong 500gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/2/2276_Suon_de_vuong_sot_mat_ong_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Sườn đế vương sốt mật ong 500gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/2/2276_Suon_de_vuong_sot_mat_ong_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/2/2276_Suon_de_vuong_sot_mat_ong_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/2/2276_Suon_de_vuong_sot_mat_ong_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/2/2276_Suon_de_vuong_sot_mat_ong_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 599000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo thịt nướng tổng hợp 3",
//       "id": 496,
//       "uid": "NDk2",
//       "image": {
//         "label": "Combo thịt nướng tổng hợp 3",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3127_Combo_thit_nuong_tong_hop_3_1_2.png",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo thịt nướng tổng hợp 3",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3127_Combo_thit_nuong_tong_hop_3_3_2.png",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3127_Combo_thit_nuong_tong_hop_3_1_2.png",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3127_Combo_thit_nuong_tong_hop_3_2_2.png",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3127_Combo_thit_nuong_tong_hop_3_3_2.png",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 596000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo thịt nướng tổng hợp 2",
//       "id": 495,
//       "uid": "NDk1",
//       "image": {
//         "label": "Combo thịt nướng tổng hợp 2",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3126_Combo_thit_nuong_tong_hop_2_1_2.png",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo thịt nướng tổng hợp 2",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3126_Combo_thit_nuong_tong_hop_2_3_2.png",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3126_Combo_thit_nuong_tong_hop_2_1_2.png",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3126_Combo_thit_nuong_tong_hop_2_2_2.png",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3126_Combo_thit_nuong_tong_hop_2_3_2.png",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 619000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Combo thịt nướng tổng hợp 1",
//       "id": 494,
//       "uid": "NDk0",
//       "image": {
//         "label": "Combo thịt nướng tổng hợp 1",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3125_Combo_thit_nuong_tong_hop_1_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Combo thịt nướng tổng hợp 1",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3125_Combo_thit_nuong_tong_hop_1_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3125_Combo_thit_nuong_tong_hop_1_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3125_Combo_thit_nuong_tong_hop_1_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3125_Combo_thit_nuong_tong_hop_1_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 429000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Cơm trộn bát đá hàn quốc sốt gogi",
//       "id": 489,
//       "uid": "NDg5",
//       "image": {
//         "label": "Cơm trộn bát đá hàn quốc sốt gogi",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2643_Com_tron_bat_da_han_quoc_sot_gogi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Cơm trộn bát đá hàn quốc sốt gogi",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2643_Com_tron_bat_da_han_quoc_sot_gogi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2643_Com_tron_bat_da_han_quoc_sot_gogi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2643_Com_tron_bat_da_han_quoc_sot_gogi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2643_Com_tron_bat_da_han_quoc_sot_gogi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Mì Jajang",
//       "id": 484,
//       "uid": "NDg0",
//       "image": {
//         "label": "Mì Jajang",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2969_Mi_Jajang_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Mì Jajang",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2969_Mi_Jajang_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2969_Mi_Jajang_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2969_Mi_Jajang_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2969_Mi_Jajang_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 89000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Rượu Mơ Haruka Crystal (200ml)",
//       "id": 3979,
//       "uid": "Mzk3OQ==",
//       "image": {
//         "label": "Rượu Mơ Haruka Crystal (200ml)",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou_mo_haruka_crystal_200ml_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Rượu Mơ Haruka Crystal (200ml)",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou_mo_haruka_crystal_200ml_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou_mo_haruka_crystal_200ml_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 129000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Canh Tương Đậu ALC",
//       "id": 3833,
//       "uid": "MzgzMw==",
//       "image": {
//         "label": "Canh Tương Đậu ALC",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-tuong-dau_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Canh Tương Đậu ALC",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-tuong-dau_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-tuong-dau_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Bạch Tuộc Baby Sốt Karubi Cay",
//       "id": 3830,
//       "uid": "MzgzMA==",
//       "image": {
//         "label": "Bạch Tuộc Baby Sốt Karubi Cay",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-baby-sot-karubi-cay.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Bạch Tuộc Baby Sốt Karubi Cay",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-baby-sot-karubi-cay.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-baby-sot-karubi-cay.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 149000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Tokpokki Nhân Phô Mai",
//       "id": 3828,
//       "uid": "MzgyOA==",
//       "image": {
//         "label": "Tokpokki Nhân Phô Mai",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/o/tokpokki-nhan-pho-mai.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Tokpokki Nhân Phô Mai",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/o/tokpokki-nhan-pho-mai.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/o/tokpokki-nhan-pho-mai.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 109000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Salad tổng hợp 300gr",
//       "id": 3824,
//       "uid": "MzgyNA==",
//       "image": {
//         "label": "Salad tổng hợp 300gr",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-tong-hop-new.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Salad tổng hợp 300gr",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-tong-hop-new.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-tong-hop-new.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 79000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nấm Hương Tươi (100gr)",
//       "id": 3822,
//       "uid": "MzgyMg==",
//       "image": {
//         "label": "Nấm Hương Tươi (100gr)",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-huong-tuoi-new.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nấm Hương Tươi (100gr)",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-huong-tuoi-new.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-huong-tuoi-new.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 39000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lẩu quân đội",
//       "id": 549,
//       "uid": "NTQ5",
//       "image": {
//         "label": "Lẩu quân đội",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9760_Lau_quan_doi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lẩu quân đội",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9760_Lau_quan_doi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9760_Lau_quan_doi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9760_Lau_quan_doi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9760_Lau_quan_doi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 329000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Kem viên Dâu Sữa",
//       "id": 501,
//       "uid": "NTAx",
//       "image": {
//         "label": "Kem viên Dâu Sữa",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vien_dau_sua.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Kem viên Dâu Sữa",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2887_Kem_vien_dau_sua_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2887_Kem_vien_dau_sua_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2887_Kem_vien_dau_sua_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2887_Kem_vien_dau_sua_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vien_dau_sua.jpg",
//           "label": null,
//           "position": 4,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 39000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Cơm trộn bát đá hàn quốc",
//       "id": 490,
//       "uid": "NDkw",
//       "image": {
//         "label": "Cơm trộn bát đá hàn quốc",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2968_Com_tron_bat_da_han_quoc_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Cơm trộn bát đá hàn quốc",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2968_Com_tron_bat_da_han_quoc_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2968_Com_tron_bat_da_han_quoc_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2968_Com_tron_bat_da_han_quoc_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2968_Com_tron_bat_da_han_quoc_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 99000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Mỳ Lạnh trộn cay",
//       "id": 483,
//       "uid": "NDgz",
//       "image": {
//         "label": "Mỳ Lạnh trộn cay",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2419_My_lanh_tron_cay_1_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Mỳ Lạnh trộn cay",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2419_My_lanh_tron_cay_3_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2419_My_lanh_tron_cay_1_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2419_My_lanh_tron_cay_2_1.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2419_My_lanh_tron_cay_3_1.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 79000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Nước Gạo LM Makgeolli Peach 3 Độ 750ml",
//       "id": 3978,
//       "uid": "Mzk3OA==",
//       "image": {
//         "label": "Nước Gạo LM Makgeolli Peach 3 Độ 750ml",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou-gao-kook-soon-dang-makgeolli-rice-peach-750ml-.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Nước Gạo LM Makgeolli Peach 3 Độ 750ml",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou-gao-kook-soon-dang-makgeolli-rice-peach-750ml-.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou-gao-kook-soon-dang-makgeolli-rice-peach-750ml-.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 149000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Mỳ Lạnh Trộn Cay",
//       "id": 3827,
//       "uid": "MzgyNw==",
//       "image": {
//         "label": "Mỳ Lạnh Trộn Cay",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/y/my_tron_lanh_1.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Mỳ Lạnh Trộn Cay",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/y/my_tron_lanh_1.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/y/my_tron_lanh_1.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 79000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Miến Hàn Quốc",
//       "id": 552,
//       "uid": "NTUy",
//       "image": {
//         "label": "Miến Hàn Quốc",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4889_Mien_han_quoc_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Miến Hàn Quốc",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4889_Mien_han_quoc_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4889_Mien_han_quoc_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4889_Mien_han_quoc_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4889_Mien_han_quoc_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 44000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Lẩu Kim Chi",
//       "id": 548,
//       "uid": "NTQ4",
//       "image": {
//         "label": "Lẩu Kim Chi",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4886_Lau_kim_chi_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Lẩu Kim Chi",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4886_Lau_kim_chi_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4886_Lau_kim_chi_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4886_Lau_kim_chi_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4886_Lau_kim_chi_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 289000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Kem viên Sữa Dừa",
//       "id": 499,
//       "uid": "NDk5",
//       "image": {
//         "label": "Kem viên Sữa Dừa",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vien_sua_dua.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Kem viên Sữa Dừa",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2885_Kem_vien_sua_dua_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2885_Kem_vien_sua_dua_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2885_Kem_vien_sua_dua_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2885_Kem_vien_sua_dua_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vien_sua_dua.jpg",
//           "label": null,
//           "position": 4,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 39000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Cơm trắng",
//       "id": 488,
//       "uid": "NDg4",
//       "image": {
//         "label": "Cơm trắng",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2428_Com_trang_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Cơm trắng",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2428_Com_trang_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2428_Com_trang_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2428_Com_trang_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2428_Com_trang_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 10000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Canh rong biển",
//       "id": 487,
//       "uid": "NDg3",
//       "image": {
//         "label": "Canh rong biển",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4883_Canh_rong_bien_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Canh rong biển",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4883_Canh_rong_bien_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4883_Canh_rong_bien_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4883_Canh_rong_bien_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4883_Canh_rong_bien_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 89000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     },
//     {
//       "name": "Salad mùa xuân",
//       "id": 429,
//       "uid": "NDI5",
//       "image": {
//         "label": "Salad mùa xuân",
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9788_Salad_mua_xuan_1_2.jpg",
//         "position": null,
//         "__typename": "ProductImage"
//       },
//       "small_image": {
//         "disabled": null,
//         "label": "Salad mùa xuân",
//         "position": null,
//         "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9788_Salad_mua_xuan_3_2.jpg",
//         "__typename": "ProductImage"
//       },
//       "media_gallery": [
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9788_Salad_mua_xuan_1_2.jpg",
//           "label": null,
//           "position": 1,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9788_Salad_mua_xuan_2_2.jpg",
//           "label": null,
//           "position": 2,
//           "__typename": "ProductImage"
//         },
//         {
//           "url": "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9788_Salad_mua_xuan_3_2.jpg",
//           "label": null,
//           "position": 3,
//           "__typename": "ProductImage"
//         }
//       ],
//       "__typename": "SimpleProduct",
//       "price_range": {
//         "minimum_price": {
//           "final_price": {
//             "currency": "VND",
//             "value": 98000,
//             "__typename": "Money"
//           },
//           "__typename": "ProductPrice"
//         },
//         "__typename": "PriceRange"
//       },
//       "description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       },
//       "short_description": {
//         "html": "",
//         "__typename": "ComplexTextValue"
//       }
//     }
//   ]
// };