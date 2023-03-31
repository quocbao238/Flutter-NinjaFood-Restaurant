class CategoryModel {
  String? name;
  int? id;
  List<int>? productIds;

  String? sTypename;

  CategoryModel({this.name, this.id, this.productIds, this.sTypename});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    productIds = json['productIds'];
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
}

//
//
// final jsonCategory = {
//   "category": [
//     {
//       "name": "GG_HCM_Bò Mát Nhập Khẩu",
//       "id": 37,
//       "products": {
//         "items": [
//           {
//             "name": "Nạc Vai & Mông Bò Angus 600gr",
//             "id": 3946,
//             "uid": "Mzk0Ng==",
//             "image": {
//               "label": "Nạc Vai & Mông Bò Angus 600gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_600gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Vai & Mông Bò Angus 600gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_600gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 829000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Vai & Nạc Lưng Bò Angus 600gr",
//             "id": 3945,
//             "uid": "Mzk0NQ==",
//             "image": {
//               "label": "Nạc Vai & Nạc Lưng Bò Angus 600gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_600gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Vai & Nạc Lưng Bò Angus 600gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_600gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 1079000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Vai & Thăn Ngoại Bò Angus 600gr",
//             "id": 3944,
//             "uid": "Mzk0NA==",
//             "image": {
//               "label": "Nạc Vai & Thăn Ngoại Bò Angus 600gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_600gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Vai & Thăn Ngoại Bò Angus 600gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_600gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 969000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lõi Vai & Mông Bò Angus 600gr",
//             "id": 3943,
//             "uid": "Mzk0Mw==",
//             "image": {
//               "label": "Lõi Vai & Mông Bò Angus 600gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_600gr_1_.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lõi Vai & Mông Bò Angus 600gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_600gr_1_.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 829000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lõi Vai & Nạc Lưng Bò Angus 600gr",
//             "id": 3942,
//             "uid": "Mzk0Mg==",
//             "image": {
//               "label": "Lõi Vai & Nạc Lưng Bò Angus 600gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_600gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lõi Vai & Nạc Lưng Bò Angus 600gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_600gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 1079000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lõi Vai & Thăn Ngoại Bò Angus 600gr",
//             "id": 3941,
//             "uid": "Mzk0MQ==",
//             "image": {
//               "label": "Lõi Vai & Thăn Ngoại Bò Angus 600gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_600gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lõi Vai & Thăn Ngoại Bò Angus 600gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_600gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 969000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Vai & Mông Bò Angus 300gr",
//             "id": 3940,
//             "uid": "Mzk0MA==",
//             "image": {
//               "label": "Nạc Vai & Mông Bò Angus 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_300gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Vai & Mông Bò Angus 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_mong_bo_angus_300gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 429000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Vai & Nạc Lưng bò Angus 300gr",
//             "id": 3939,
//             "uid": "MzkzOQ==",
//             "image": {
//               "label": "Nạc Vai & Nạc Lưng bò Angus 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_300gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Vai & Nạc Lưng bò Angus 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_nac_lung_bo_angus_300gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 599000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Vai & Thăn Ngoại Bò Angus 300gr",
//             "id": 3938,
//             "uid": "MzkzOA==",
//             "image": {
//               "label": "Nạc Vai & Thăn Ngoại Bò Angus 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_300gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Vai & Thăn Ngoại Bò Angus 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_than_ngoai_bo_angus_300gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 489000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lõi Vai & Mông Bò Angus 300gr",
//             "id": 3937,
//             "uid": "MzkzNw==",
//             "image": {
//               "label": "Lõi Vai & Mông Bò Angus 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_300gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lõi Vai & Mông Bò Angus 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_mong_bo_angus_300gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 429000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lõi Vai & Nạc Lưng Bò Angus 300gr",
//             "id": 3936,
//             "uid": "MzkzNg==",
//             "image": {
//               "label": "Lõi Vai & Nạc Lưng Bò Angus 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_300gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lõi Vai & Nạc Lưng Bò Angus 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_nac_lung_bo_angus_300gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 589000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lõi Vai & Thăn Ngoại Bò Angus 300gr",
//             "id": 3935,
//             "uid": "MzkzNQ==",
//             "image": {
//               "label": "Lõi Vai & Thăn Ngoại Bò Angus 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_300gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lõi Vai & Thăn Ngoại Bò Angus 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_than_ngoai_bo_angus_300gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 499000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (lớn)",
//             "id": 3934,
//             "uid": "MzkzNA==",
//             "image": {
//               "label": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (lớn)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_lon.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (lớn)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_lon.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 969000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (nhỏ)",
//             "id": 3933,
//             "uid": "MzkzMw==",
//             "image": {
//               "label": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (nhỏ)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_nho.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Hảo Hạng Thăn Ngoại & Mông Bò Angus (nhỏ)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_hao_hang_than_ngoai_mong_bo_angus_nho.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 489000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (lớn)",
//             "id": 3932,
//             "uid": "MzkzMg==",
//             "image": {
//               "label": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (lớn)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_lon.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (lớn)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_lon.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 1029000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (nhỏ)",
//             "id": 3931,
//             "uid": "MzkzMQ==",
//             "image": {
//               "label": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (nhỏ)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_nho.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Thượng Hạng Nạc Lưng & Thăn Ngoại Bò Angus (nhỏ)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_thuong_hang_nac_lung_than_ngoai_bo_angus_nho.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 519000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Vai Bò Mát Nhập Khẩu",
//             "id": 3930,
//             "uid": "MzkzMA==",
//             "image": {
//               "label": "Nạc Vai Bò Mát Nhập Khẩu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_bo_mat_nhap_khau.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Vai Bò Mát Nhập Khẩu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_vai_bo_mat_nhap_khau.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 169000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lõi Vai Bò Mát Nhập Khẩu",
//             "id": 3929,
//             "uid": "MzkyOQ==",
//             "image": {
//               "label": "Lõi Vai Bò Mát Nhập Khẩu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_bo_mat_nhap_khau.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lõi Vai Bò Mát Nhập Khẩu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/o/loi_vai_bo_mat_nhap_khau.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 179000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mông Bò Mát Nhập Khẩu",
//             "id": 3928,
//             "uid": "MzkyOA==",
//             "image": {
//               "label": "Mông Bò Mát Nhập Khẩu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong_bo_mat_nhap_khau.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mông Bò Mát Nhập Khẩu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong_bo_mat_nhap_khau.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 219000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Lưng Bò Mát Nhập Khẩu",
//             "id": 3927,
//             "uid": "MzkyNw==",
//             "image": {
//               "label": "Nạc Lưng Bò Mát Nhập Khẩu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_lung_bo_mat_nhap_khau.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Lưng Bò Mát Nhập Khẩu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac_lung_bo_mat_nhap_khau.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 279000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Thăn Ngoại Bò Mát Nhập Khẩu",
//             "id": 3926,
//             "uid": "MzkyNg==",
//             "image": {
//               "label": "Thăn Ngoại Bò Mát Nhập Khẩu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_ngoai_bo_mat_nhap_khau.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Thăn Ngoại Bò Mát Nhập Khẩu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_ngoai_bo_mat_nhap_khau.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 269000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 21,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Set",
//       "id": 33,
//       "products": {
//         "items": [
//           {
//             "name": "Thăn Nội Bò Mỹ 600gr",
//             "id": 3795,
//             "uid": "Mzc5NQ==",
//             "image": {
//               "label": "Thăn Nội Bò Mỹ 600gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_noi_bo_my_600gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Thăn Nội Bò Mỹ 600gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than_noi_bo_my_600gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 749000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn LA Galbi 300g + Sườn Hoàng Đế",
//             "id": 3803,
//             "uid": "MzgwMw==",
//             "image": {
//               "label": "Sườn LA Galbi 300g + Sườn Hoàng Đế",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_suon_hoang_de.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn LA Galbi 300g + Sườn Hoàng Đế",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_suon_hoang_de.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 749000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn LA Galbi 300g + Sườn Bò LA Galbi",
//             "id": 3804,
//             "uid": "MzgwNA==",
//             "image": {
//               "label": "Sườn LA Galbi 300g + Sườn Bò LA Galbi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_than_noi_bo_my.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn LA Galbi 300g + Sườn Bò LA Galbi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_la_galbi_300g_than_noi_bo_my.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 749000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn non Bò mỹ bỏ xương 600gr",
//             "id": 3806,
//             "uid": "MzgwNg==",
//             "image": {
//               "label": "Sườn non Bò mỹ bỏ xương 600gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_bo_xuong.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn non Bò mỹ bỏ xương 600gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_bo_xuong.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 749000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Tiết Kiệm 2",
//             "id": 3925,
//             "uid": "MzkyNQ==",
//             "image": {
//               "label": "Combo Tiết Kiệm 2",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Tiết Kiệm 2",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 649000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Tiết Kiệm 1",
//             "id": 3924,
//             "uid": "MzkyNA==",
//             "image": {
//               "label": "Combo Tiết Kiệm 1",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Tiết Kiệm 1",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_tiet_kiem_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 649000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Thăn Nội Bò Mỹ + Sườn Hoàng Đế",
//             "id": 3922,
//             "uid": "MzkyMg==",
//             "image": {
//               "label": "Combo Thăn Nội Bò Mỹ + Sườn Hoàng Đế",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_hoang_de.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Thăn Nội Bò Mỹ + Sườn Hoàng Đế",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_hoang_de.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 769000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Sườn Hoàng Đế + Sườn Bò Mỹ Bỏ Xương",
//             "id": 3921,
//             "uid": "MzkyMQ==",
//             "image": {
//               "label": "Combo Sườn Hoàng Đế + Sườn Bò Mỹ Bỏ Xương",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_suon_hoang_de_suon_bo_my_bo_xuong.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Sườn Hoàng Đế + Sườn Bò Mỹ Bỏ Xương",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_suon_hoang_de_suon_bo_my_bo_xuong.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 749000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Thăn Nội Bò Mỹ + Sườn Bò Mỹ",
//             "id": 3920,
//             "uid": "MzkyMA==",
//             "image": {
//               "label": "Combo Thăn Nội Bò Mỹ + Sườn Bò Mỹ",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_bo_my.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Thăn Nội Bò Mỹ + Sườn Bò Mỹ",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo_than_noi_bo_my_suon_bo_my.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 749000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo thịt nướng tổng hợp 3",
//             "id": 496,
//             "uid": "NDk2",
//             "image": {
//               "label": "Combo thịt nướng tổng hợp 3",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3127_Combo_thit_nuong_tong_hop_3_1_2.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo thịt nướng tổng hợp 3",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3127_Combo_thit_nuong_tong_hop_3_3_2.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 596000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo thịt nướng tổng hợp 2",
//             "id": 495,
//             "uid": "NDk1",
//             "image": {
//               "label": "Combo thịt nướng tổng hợp 2",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3126_Combo_thit_nuong_tong_hop_2_1_2.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo thịt nướng tổng hợp 2",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3126_Combo_thit_nuong_tong_hop_2_3_2.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 619000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo thịt nướng tổng hợp 1",
//             "id": 494,
//             "uid": "NDk0",
//             "image": {
//               "label": "Combo thịt nướng tổng hợp 1",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3125_Combo_thit_nuong_tong_hop_1_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo thịt nướng tổng hợp 1",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3125_Combo_thit_nuong_tong_hop_1_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 429000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 12,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Thịt bò",
//       "id": 36,
//       "products": {
//         "items": [
//           {
//             "name": "Sườn Non Bò Mỹ Sốt Obathan",
//             "id": 3808,
//             "uid": "MzgwOA==",
//             "image": {
//               "label": "Sườn Non Bò Mỹ Sốt Obathan",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Non Bò Mỹ Sốt Obathan",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 419000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn Non Bò Mỹ LA Sốt Galbi 150gr",
//             "id": 3801,
//             "uid": "MzgwMQ==",
//             "image": {
//               "label": "Sườn Non Bò Mỹ LA Sốt Galbi 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_la_galbi_600gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Non Bò Mỹ LA Sốt Galbi 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_la_galbi_600gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 239000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn Non Bò Mỹ Sốt Obathan 300gr",
//             "id": 3800,
//             "uid": "MzgwMA==",
//             "image": {
//               "label": "Sườn Non Bò Mỹ Sốt Obathan 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_sot_obathan.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Non Bò Mỹ Sốt Obathan 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_sot_obathan.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 359000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn Non Bò Mỹ Hảo Hạng Tươi 150gr",
//             "id": 3799,
//             "uid": "Mzc5OQ==",
//             "image": {
//               "label": "Sườn Non Bò Mỹ Hảo Hạng Tươi 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_hao_hang_tuoi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Non Bò Mỹ Hảo Hạng Tươi 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_hao_hang_tuoi.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 349000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn Non Bò Mỹ Hảo Hạng Sốt Obathan",
//             "id": 3798,
//             "uid": "Mzc5OA==",
//             "image": {
//               "label": "Sườn Non Bò Mỹ Hảo Hạng Sốt Obathan",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_my_hao_hang_sot_obanthan.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Non Bò Mỹ Hảo Hạng Sốt Obathan",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_my_hao_hang_sot_obanthan.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 349000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Dẻ Sườn Bò Mỹ Sốt Mật Ong 150gr",
//             "id": 3797,
//             "uid": "Mzc5Nw==",
//             "image": {
//               "label": "Dẻ Sườn Bò Mỹ Sốt Mật Ong 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_tuoi_mat_ong.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Dẻ Sườn Bò Mỹ Sốt Mật Ong 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_tuoi_mat_ong.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 229000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Dẻ Sườn Bò Mỹ Sốt Obathan 150gr",
//             "id": 3796,
//             "uid": "Mzc5Ng==",
//             "image": {
//               "label": "Dẻ Sườn Bò Mỹ Sốt Obathan 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Dẻ Sườn Bò Mỹ Sốt Obathan 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 229000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Thăn Ngoại Bò STRIPLOIN ANGUS",
//             "id": 3794,
//             "uid": "Mzc5NA==",
//             "image": {
//               "label": "Thăn Ngoại Bò STRIPLOIN ANGUS",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than-ngoai-bo-strip.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Thăn Ngoại Bò STRIPLOIN ANGUS",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/h/than-ngoai-bo-strip.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 269000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Lưng Bò RIBEYE ANGUS",
//             "id": 3793,
//             "uid": "Mzc5Mw==",
//             "image": {
//               "label": "Nạc Lưng Bò RIBEYE ANGUS",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-lung-bo-ribeye.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Lưng Bò RIBEYE ANGUS",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-lung-bo-ribeye.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 279000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mông Bò Angus",
//             "id": 3792,
//             "uid": "Mzc5Mg==",
//             "image": {
//               "label": "Mông Bò Angus",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong-bo-angus.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mông Bò Angus",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mong-bo-angus.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 219000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lõi Vai Oyster Blade",
//             "id": 3791,
//             "uid": "Mzc5MQ==",
//             "image": {
//               "label": "Lõi Vai Oyster Blade",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-loi-vai-oyster-blade.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lõi Vai Oyster Blade",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-loi-vai-oyster-blade.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 199000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc Vai Top Blade",
//             "id": 3790,
//             "uid": "Mzc5MA==",
//             "image": {
//               "label": "Nạc Vai Top Blade",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-nac-vai-top-blade.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc Vai Top Blade",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/g/g/gg-nac-vai-top-blade.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 189000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn Bò Tomahawk 700gr",
//             "id": 3789,
//             "uid": "Mzc4OQ==",
//             "image": {
//               "label": "Sườn Bò Tomahawk 700gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_tomahawk_700gr.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Bò Tomahawk 700gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_bo_tomahawk_700gr.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 1990000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Ba chỉ bò mỹ sốt obathan",
//             "id": 566,
//             "uid": "NTY2",
//             "image": {
//               "label": "Ba chỉ bò mỹ sốt obathan",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/ba_chi_bo_my_sot_obathan.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Ba chỉ bò mỹ sốt obathan",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 139000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Gầu bò mỹ sốt obathan",
//             "id": 565,
//             "uid": "NTY1",
//             "image": {
//               "label": "Gầu bò mỹ sốt obathan",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4880_Gau_bo_my_sot_obathan_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Gầu bò mỹ sốt obathan",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4880_Gau_bo_my_sot_obathan_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 139000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn non bò mỹ sốt galbi 300gr",
//             "id": 564,
//             "uid": "NTY0",
//             "image": {
//               "label": "Sườn non bò mỹ sốt galbi 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2857_Suon_non_bo_My_sot_Galbi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn non bò mỹ sốt galbi 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2857_Suon_non_bo_My_sot_Galbi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 449000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn non bò mỹ LA sốt Obathan 150gr",
//             "id": 563,
//             "uid": "NTYz",
//             "image": {
//               "label": "Sườn non bò mỹ LA sốt Obathan 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_non_bo_my_la_sot_obathan.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn non bò mỹ LA sốt Obathan 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 239000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Dẻ sườn hoàng đế tươi 150gr",
//             "id": 562,
//             "uid": "NTYy",
//             "image": {
//               "label": "Dẻ sườn hoàng đế tươi 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_hoang_de_tuoi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Dẻ sườn hoàng đế tươi 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 239000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Diềm bụng bò mỹ tươi 150gr",
//             "id": 561,
//             "uid": "NTYx",
//             "image": {
//               "label": "Diềm bụng bò mỹ tươi 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2851_Diem_bung_bo_My_tuoi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Diềm bụng bò mỹ tươi 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2851_Diem_bung_bo_My_tuoi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 329000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Ba chỉ bò mỹ sốt mật ong 150gr",
//             "id": 560,
//             "uid": "NTYw",
//             "image": {
//               "label": "Ba chỉ bò mỹ sốt mật ong 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2850_ba_chi_bo_my_sot_mat_ong_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Ba chỉ bò mỹ sốt mật ong 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2850_ba_chi_bo_my_sot_mat_ong_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 139000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Gầu bò mỹ sốt mật ong 150gr",
//             "id": 559,
//             "uid": "NTU5",
//             "image": {
//               "label": "Gầu bò mỹ sốt mật ong 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2849_gau_bo_my_sot_mat_ong_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Gầu bò mỹ sốt mật ong 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2849_gau_bo_my_sot_mat_ong_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 129000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn non Bò mỹ tươi (300g)",
//             "id": 558,
//             "uid": "NTU4",
//             "image": {
//               "label": "Sườn non Bò mỹ tươi (300g)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2795_Suon_non_bo_My_tuoi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn non Bò mỹ tươi (300g)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2795_Suon_non_bo_My_tuoi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 429000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Diềm bụng bò mỹ sốt Obathan",
//             "id": 557,
//             "uid": "NTU3",
//             "image": {
//               "label": "Diềm bụng bò mỹ sốt Obathan",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2426_Diem_bung_bo_My_sot_Obathan_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Diềm bụng bò mỹ sốt Obathan",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2426_Diem_bung_bo_My_sot_Obathan_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 329000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn đế vương sốt galbi",
//             "id": 556,
//             "uid": "NTU2",
//             "image": {
//               "label": "Sườn đế vương sốt galbi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2415_Suon_de_vuong_sot_Galbi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn đế vương sốt galbi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2415_Suon_de_vuong_sot_Galbi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 599000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Dẻ sườn hoàng đế sốt galbi",
//             "id": 555,
//             "uid": "NTU1",
//             "image": {
//               "label": "Dẻ sườn hoàng đế sốt galbi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2413_De_suon_hoang_de_sot_Galbi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Dẻ sườn hoàng đế sốt galbi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2413_De_suon_hoang_de_sot_Galbi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 239000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Dẻ sườn hoàng đế sốt obathan",
//             "id": 554,
//             "uid": "NTU0",
//             "image": {
//               "label": "Dẻ sườn hoàng đế sốt obathan",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2412_De_suon_hoang_de_sot_obathan_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Dẻ sườn hoàng đế sốt obathan",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2412_De_suon_hoang_de_sot_obathan_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 239000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn đế vương sốt mật ong 500gr",
//             "id": 553,
//             "uid": "NTUz",
//             "image": {
//               "label": "Sườn đế vương sốt mật ong 500gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/2/2276_Suon_de_vuong_sot_mat_ong_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn đế vương sốt mật ong 500gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/2/2276_Suon_de_vuong_sot_mat_ong_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 599000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 27,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Thịt Heo",
//       "id": 38,
//       "products": {
//         "items": [
//           {
//             "name": "Nạc vai heo ủ sốt tương đậu",
//             "id": 3820,
//             "uid": "MzgyMA==",
//             "image": {
//               "label": "Nạc vai heo ủ sốt tương đậu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-vai-heo-tuong-daualc_3.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc vai heo ủ sốt tương đậu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nac-vai-heo-tuong-daualc_3.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Ba Chỉ Heo Mỹ Sốt Ủ Tương Đậu",
//             "id": 3812,
//             "uid": "MzgxMg==",
//             "image": {
//               "label": "Ba Chỉ Heo Mỹ Sốt Ủ Tương Đậu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/ba-chi-heo-sot-tuong-dau.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Ba Chỉ Heo Mỹ Sốt Ủ Tương Đậu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/ba-chi-heo-sot-tuong-dau.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn Sụn Heo Sốt Galbi 150gr",
//             "id": 3811,
//             "uid": "MzgxMQ==",
//             "image": {
//               "label": "Sườn Sụn Heo Sốt Galbi 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Sụn Heo Sốt Galbi 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 159000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn Heo Mỹ Sốt Obathan 300gr",
//             "id": 3810,
//             "uid": "MzgxMA==",
//             "image": {
//               "label": "Sườn Heo Mỹ Sốt Obathan 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_obathan.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Heo Mỹ Sốt Obathan 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_obathan.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 159000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn Heo Mỹ Sốt Galbi 300gr",
//             "id": 3809,
//             "uid": "MzgwOQ==",
//             "image": {
//               "label": "Sườn Heo Mỹ Sốt Galbi 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn Heo Mỹ Sốt Galbi 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 159000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Má heo mỹ tươi 150gr",
//             "id": 586,
//             "uid": "NTg2",
//             "image": {
//               "label": "Má heo mỹ tươi 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2868_ma_heo_my_tuoi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Má heo mỹ tươi 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2868_ma_heo_my_tuoi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 129000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc vai heo sốt obathan 150gr",
//             "id": 582,
//             "uid": "NTgy",
//             "image": {
//               "label": "Nạc vai heo sốt obathan 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2864_Nac_vai_heo_sot_Obathan_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc vai heo sốt obathan 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2864_Nac_vai_heo_sot_Obathan_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nạc vai heo sốt galbi 150gr",
//             "id": 581,
//             "uid": "NTgx",
//             "image": {
//               "label": "Nạc vai heo sốt galbi 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2863_Nac_Vai_heo_sot_Galbi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nạc vai heo sốt galbi 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2863_Nac_Vai_heo_sot_Galbi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Ba chỉ heo mỹ sốt obathan 150gr",
//             "id": 580,
//             "uid": "NTgw",
//             "image": {
//               "label": "Ba chỉ heo mỹ sốt obathan 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2862_Ba_Chi_Heo_My_Sot_Obathan_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Ba chỉ heo mỹ sốt obathan 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2862_Ba_Chi_Heo_My_Sot_Obathan_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Ba chỉ heo mỹ tươi 150gr",
//             "id": 579,
//             "uid": "NTc5",
//             "image": {
//               "label": "Ba chỉ heo mỹ tươi 150gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2861_Ba_chi_heo_my_tuoi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Ba chỉ heo mỹ tươi 150gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2861_Ba_chi_heo_my_tuoi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Má heo mỹ sốt obathan",
//             "id": 578,
//             "uid": "NTc4",
//             "image": {
//               "label": "Má heo mỹ sốt obathan",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2417_ma_heo_my_sot_obathan_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Má heo mỹ sốt obathan",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2417_ma_heo_my_sot_obathan_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 129000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sườn sụn heo sốt obathan",
//             "id": 577,
//             "uid": "NTc3",
//             "image": {
//               "label": "Sườn sụn heo sốt obathan",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2416_Suon_sun_heo_sot_Obathan_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sườn sụn heo sốt obathan",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2416_Suon_sun_heo_sot_Obathan_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 149000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 12,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Salad",
//       "id": 312,
//       "products": {
//         "items": [
//           {
//             "name": "Salad Củ Sen",
//             "id": 3825,
//             "uid": "MzgyNQ==",
//             "image": {
//               "label": "Salad Củ Sen",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-cu-sen-new.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Salad Củ Sen",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-cu-sen-new.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 98000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Salad tổng hợp 300gr",
//             "id": 3824,
//             "uid": "MzgyNA==",
//             "image": {
//               "label": "Salad tổng hợp 300gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-tong-hop-new.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Salad tổng hợp 300gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-tong-hop-new.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Salad mùa xuân",
//             "id": 429,
//             "uid": "NDI5",
//             "image": {
//               "label": "Salad mùa xuân",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9788_Salad_mua_xuan_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Salad mùa xuân",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9788_Salad_mua_xuan_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 98000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Salad hoa quả tươi 500gr",
//             "id": 427,
//             "uid": "NDI3",
//             "image": {
//               "label": "Salad hoa quả tươi 500gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2621_Salad_hoa_qua_tuoi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Salad hoa quả tươi 500gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2621_Salad_hoa_qua_tuoi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 119000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Salad cá ngừ 200gr",
//             "id": 426,
//             "uid": "NDI2",
//             "image": {
//               "label": "Salad cá ngừ 200gr",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2620_Salad_ca_ngu_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Salad cá ngừ 200gr",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2620_Salad_ca_ngu_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 5,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Cơm",
//       "id": 313,
//       "products": {
//         "items": [
//           {
//             "name": "Cơm Trộn Bạch Tuộc",
//             "id": 4059,
//             "uid": "NDA1OQ==",
//             "image": {
//               "label": "Cơm Trộn Bạch Tuộc",
//               "url":
//               "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/image.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Cơm Trộn Bạch Tuộc",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Cơm trộn bát đá hàn quốc sốt gogi",
//             "id": 489,
//             "uid": "NDg5",
//             "image": {
//               "label": "Cơm trộn bát đá hàn quốc sốt gogi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2643_Com_tron_bat_da_han_quoc_sot_gogi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Cơm trộn bát đá hàn quốc sốt gogi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2643_Com_tron_bat_da_han_quoc_sot_gogi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Cơm trộn bát đá hàn quốc",
//             "id": 490,
//             "uid": "NDkw",
//             "image": {
//               "label": "Cơm trộn bát đá hàn quốc",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2968_Com_tron_bat_da_han_quoc_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Cơm trộn bát đá hàn quốc",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2968_Com_tron_bat_da_han_quoc_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Cơm trắng",
//             "id": 488,
//             "uid": "NDg4",
//             "image": {
//               "label": "Cơm trắng",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2428_Com_trang_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Cơm trắng",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2428_Com_trang_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 10000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 4,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Món Truyền Thống",
//       "id": 32,
//       "products": {
//         "items": [
//           {
//             "name": "Bạch Tuộc Sốt Cay",
//             "id": 3829,
//             "uid": "MzgyOQ==",
//             "image": {
//               "label": "Bạch Tuộc Sốt Cay",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuot-sot-cay.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bạch Tuộc Sốt Cay",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuot-sot-cay.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 109000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Tokpokki Nhân Phô Mai",
//             "id": 3828,
//             "uid": "MzgyOA==",
//             "image": {
//               "label": "Tokpokki Nhân Phô Mai",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/o/tokpokki-nhan-pho-mai.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Tokpokki Nhân Phô Mai",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/o/tokpokki-nhan-pho-mai.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 109000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mỳ Lạnh Trộn Cay",
//             "id": 3827,
//             "uid": "MzgyNw==",
//             "image": {
//               "label": "Mỳ Lạnh Trộn Cay",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/y/my_tron_lanh_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mỳ Lạnh Trộn Cay",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/y/my_tron_lanh_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mỳ Lạnh Nước",
//             "id": 3826,
//             "uid": "MzgyNg==",
//             "image": {
//               "label": "Mỳ Lạnh Nước",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/y/my_lanh_nuoc.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mỳ Lạnh Nước",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/y/my_lanh_nuoc.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Toboki xào hải sản",
//             "id": 424,
//             "uid": "NDI0",
//             "image": {
//               "label": "Toboki xào hải sản",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2421_Tokboki_xao_hai_san_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Toboki xào hải sản",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2421_Tokboki_xao_hai_san_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 109000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bánh xèo hải sản Gogi",
//             "id": 423,
//             "uid": "NDIz",
//             "image": {
//               "label": "Bánh xèo hải sản Gogi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2630_Banh_xeo_hai_san_Gogi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bánh xèo hải sản Gogi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2630_Banh_xeo_hai_san_Gogi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 89000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Há cảo truyền thống Hàn Quốc",
//             "id": 422,
//             "uid": "NDIy",
//             "image": {
//               "label": "Há cảo truyền thống Hàn Quốc",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2424_Ha_cao_truyen_thong_han_quoc_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Há cảo truyền thống Hàn Quốc",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2424_Ha_cao_truyen_thong_han_quoc_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 69000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Kimbap chiên",
//             "id": 421,
//             "uid": "NDIx",
//             "image": {
//               "label": "Kimbap chiên",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/6/4606_Kimbap_chien_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Kimbap chiên",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/6/4606_Kimbap_chien_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Miến trộn tổng hợp",
//             "id": 420,
//             "uid": "NDIw",
//             "image": {
//               "label": "Miến trộn tổng hợp",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2750_Mien_tron_tong_hop_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Miến trộn tổng hợp",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2750_Mien_tron_tong_hop_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 9,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Hải Sản",
//       "id": 39,
//       "products": {
//         "items": [
//           {
//             "name": "Bạch Tuộc Đại Dương Sốt Cay Đặc Biệt",
//             "id": 3831,
//             "uid": "MzgzMQ==",
//             "image": {
//               "label": "Bạch Tuộc Đại Dương Sốt Cay Đặc Biệt",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-dai-duong-sot-cay-dac-biet.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bạch Tuộc Đại Dương Sốt Cay Đặc Biệt",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-dai-duong-sot-cay-dac-biet.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 229000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bạch Tuộc Baby Sốt Karubi Cay",
//             "id": 3830,
//             "uid": "MzgzMA==",
//             "image": {
//               "label": "Bạch Tuộc Baby Sốt Karubi Cay",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-baby-sot-karubi-cay.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bạch Tuộc Baby Sốt Karubi Cay",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/a/bach-tuoc-baby-sot-karubi-cay.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 149000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 2,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Canh",
//       "id": 31,
//       "products": {
//         "items": [
//           {
//             "name": "Canh Thịt Bò Bulgogi ALC",
//             "id": 3834,
//             "uid": "MzgzNA==",
//             "image": {
//               "label": "Canh Thịt Bò Bulgogi ALC",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-thit-bo-bulgogi-new.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Canh Thịt Bò Bulgogi ALC",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-thit-bo-bulgogi-new.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Canh Tương Đậu ALC",
//             "id": 3833,
//             "uid": "MzgzMw==",
//             "image": {
//               "label": "Canh Tương Đậu ALC",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-tuong-dau_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Canh Tương Đậu ALC",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/a/canh-tuong-dau_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Canh rong biển",
//             "id": 487,
//             "uid": "NDg3",
//             "image": {
//               "label": "Canh rong biển",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4883_Canh_rong_bien_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Canh rong biển",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4883_Canh_rong_bien_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 89000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Súp nghêu Wakame",
//             "id": 486,
//             "uid": "NDg2",
//             "image": {
//               "label": "Súp nghêu Wakame",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2638_Sup_ngheu_wakame_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Súp nghêu Wakame",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2638_Sup_ngheu_wakame_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 99000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Canh kim chi",
//             "id": 485,
//             "uid": "NDg1",
//             "image": {
//               "label": "Canh kim chi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/3/1377_Canh_kim_chi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Canh kim chi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/3/1377_Canh_kim_chi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 89000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 5,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Lẩu",
//       "id": 35,
//       "products": {
//         "items": [
//           {
//             "name": "Lẩu Cay Hải Sản",
//             "id": 3821,
//             "uid": "MzgyMQ==",
//             "image": {
//               "label": "Lẩu Cay Hải Sản",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/a/lau-cay-hai-san.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lẩu Cay Hải Sản",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/l/a/lau-cay-hai-san.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 319000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lẩu quân đội",
//             "id": 549,
//             "uid": "NTQ5",
//             "image": {
//               "label": "Lẩu quân đội",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9760_Lau_quan_doi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lẩu quân đội",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/7/9760_Lau_quan_doi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 329000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lẩu Kim Chi",
//             "id": 548,
//             "uid": "NTQ4",
//             "image": {
//               "label": "Lẩu Kim Chi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4886_Lau_kim_chi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lẩu Kim Chi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4886_Lau_kim_chi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 289000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Lẩu Bulgogi",
//             "id": 547,
//             "uid": "NTQ3",
//             "image": {
//               "label": "Lẩu Bulgogi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4885_Lau_Bulgogi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Lẩu Bulgogi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4885_Lau_Bulgogi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 289000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 4,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Rau Mì",
//       "id": 314,
//       "products": {
//         "items": [
//           {
//             "name": "Mì Jajang",
//             "id": 484,
//             "uid": "NDg0",
//             "image": {
//               "label": "Mì Jajang",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2969_Mi_Jajang_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mì Jajang",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/9/2969_Mi_Jajang_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 89000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mỳ Lạnh trộn cay",
//             "id": 483,
//             "uid": "NDgz",
//             "image": {
//               "label": "Mỳ Lạnh trộn cay",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2419_My_lanh_tron_cay_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mỳ Lạnh trộn cay",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2419_My_lanh_tron_cay_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Miến Hàn Quốc",
//             "id": 552,
//             "uid": "NTUy",
//             "image": {
//               "label": "Miến Hàn Quốc",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4889_Mien_han_quoc_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Miến Hàn Quốc",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/4/8/4889_Mien_han_quoc_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 44000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mì Hàn Quốc",
//             "id": 551,
//             "uid": "NTUx",
//             "image": {
//               "label": "Mì Hàn Quốc",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2751_Mi_han_quoc_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mì Hàn Quốc",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2751_Mi_han_quoc_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 33000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rau",
//             "id": 550,
//             "uid": "NTUw",
//             "image": {
//               "label": "Rau",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/2/1266_Rau_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rau",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/2/1266_Rau_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 5,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Nấm",
//       "id": 315,
//       "products": {
//         "items": [
//           {
//             "name": "Nấm Tiên",
//             "id": 3823,
//             "uid": "MzgyMw==",
//             "image": {
//               "label": "Nấm Tiên",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-tien-new_1_1_.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nấm Tiên",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-tien-new_1_1_.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 22000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nấm Hương Tươi (100gr)",
//             "id": 3822,
//             "uid": "MzgyMg==",
//             "image": {
//               "label": "Nấm Hương Tươi (100gr)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-huong-tuoi-new.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nấm Hương Tươi (100gr)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/a/nam-huong-tuoi-new.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 2,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Tráng Miệng",
//       "id": 311,
//       "products": {
//         "items": [
//           {
//             "name": "Khăn Lạnh Golden Gate",
//             "id": 3980,
//             "uid": "Mzk4MA==",
//             "image": {
//               "label": "Khăn Lạnh Golden Gate",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/h/khan_lanh_golden_gate.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Khăn Lạnh Golden Gate",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/h/khan_lanh_golden_gate.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 5000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Kem viên Dâu Sữa",
//             "id": 501,
//             "uid": "NTAx",
//             "image": {
//               "label": "Kem viên Dâu Sữa",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vien_dau_sua.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Kem viên Dâu Sữa",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2887_Kem_vien_dau_sua_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Kem viên Sữa Dừa",
//             "id": 499,
//             "uid": "NDk5",
//             "image": {
//               "label": "Kem viên Sữa Dừa",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vien_sua_dua.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Kem viên Sữa Dừa",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2885_Kem_vien_sua_dua_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Kem viên Sô Cô La",
//             "id": 497,
//             "uid": "NDk3",
//             "image": {
//               "label": "Kem viên Sô Cô La",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vien_so_co_la.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Kem viên Sô Cô La",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/0/2098_Kem_socola_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Kem Vani",
//             "id": 3989,
//             "uid": "Mzk4OQ==",
//             "image": {
//               "label": "Kem Vani",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vani_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Kem Vani",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/e/kem_vani_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Panna Cotta Mâm Xôi",
//             "id": 3988,
//             "uid": "Mzk4OA==",
//             "image": {
//               "label": "Panna Cotta Mâm Xôi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_mam_xoi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Panna Cotta Mâm Xôi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_mam_xoi.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 19000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Panna Cotta Kiwi",
//             "id": 3987,
//             "uid": "Mzk4Nw==",
//             "image": {
//               "label": "Panna Cotta Kiwi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_kiwi_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Panna Cotta Kiwi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_kiwi_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 19000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Panna Cotta Chanh Dây (ALC)",
//             "id": 3986,
//             "uid": "Mzk4Ng==",
//             "image": {
//               "label": "Panna Cotta Chanh Dây (ALC)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_chanh_day_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Panna Cotta Chanh Dây (ALC)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_chanh_day_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 19000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Panna Cotta Dâu Rừng",
//             "id": 3985,
//             "uid": "Mzk4NQ==",
//             "image": {
//               "label": "Panna Cotta Dâu Rừng",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_dau_rung_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Panna Cotta Dâu Rừng",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_dau_rung_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 19000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Panna Cotta Dâu",
//             "id": 3984,
//             "uid": "Mzk4NA==",
//             "image": {
//               "label": "Panna Cotta Dâu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_dau_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Panna Cotta Dâu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/a/panna_cotta_dau_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 19000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Set Panna Cotta 4 Vị",
//             "id": 3983,
//             "uid": "Mzk4Mw==",
//             "image": {
//               "label": "Set Panna Cotta 4 Vị",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/e/set_panna_cotta_4_vi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Set Panna Cotta 4 Vị",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/e/set_panna_cotta_4_vi.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 64000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 11,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     },
//     {
//       "name": "GG_HCM_Đồ uống",
//       "id": 34,
//       "products": {
//         "items": [
//           {
//             "name": "Khăn Lạnh Golden Gate",
//             "id": 3980,
//             "uid": "Mzk4MA==",
//             "image": {
//               "label": "Khăn Lạnh Golden Gate",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/h/khan_lanh_golden_gate.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Khăn Lạnh Golden Gate",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/h/khan_lanh_golden_gate.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 5000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rượu Mơ Haruka Crystal (200ml)",
//             "id": 3979,
//             "uid": "Mzk3OQ==",
//             "image": {
//               "label": "Rượu Mơ Haruka Crystal (200ml)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou_mo_haruka_crystal_200ml_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rượu Mơ Haruka Crystal (200ml)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou_mo_haruka_crystal_200ml_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 129000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước Gạo LM Makgeolli Peach 3 Độ 750ml",
//             "id": 3978,
//             "uid": "Mzk3OA==",
//             "image": {
//               "label": "Nước Gạo LM Makgeolli Peach 3 Độ 750ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou-gao-kook-soon-dang-makgeolli-rice-peach-750ml-.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước Gạo LM Makgeolli Peach 3 Độ 750ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou-gao-kook-soon-dang-makgeolli-rice-peach-750ml-.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 149000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước Gạo LM Draft Makgeolli 6 Độ 750ml",
//             "id": 3977,
//             "uid": "Mzk3Nw==",
//             "image": {
//               "label": "Nước Gạo LM Draft Makgeolli 6 Độ 750ml",
//               "url":
//               "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/image.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước Gạo LM Draft Makgeolli 6 Độ 750ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 175000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước Gạo LM Makgeolli 6 Độ 750ml",
//             "id": 3976,
//             "uid": "Mzk3Ng==",
//             "image": {
//               "label": "Nước Gạo LM Makgeolli 6 Độ 750ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou-gao-makkoli-xanh-750mlchai.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước Gạo LM Makgeolli 6 Độ 750ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/r/u/ruou-gao-makkoli-xanh-750mlchai.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 155000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Táo Xanh Cocktail",
//             "id": 3975,
//             "uid": "Mzk3NQ==",
//             "image": {
//               "label": "Táo Xanh Cocktail",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/a/tao-xanh-cocktail.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Táo Xanh Cocktail",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/a/tao-xanh-cocktail.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 59000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Rượu Soju Mix Trái Cây",
//             "id": 3974,
//             "uid": "Mzk3NA==",
//             "image": {
//               "label": "Combo Rượu Soju Mix Trái Cây",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo-ruou-soju-mix-trai-cay.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Rượu Soju Mix Trái Cây",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo-ruou-soju-mix-trai-cay.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 199000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Xoài Mojito",
//             "id": 3973,
//             "uid": "Mzk3Mw==",
//             "image": {
//               "label": "Xoài Mojito",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/x/o/xoai-mojito.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Xoài Mojito",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/x/o/xoai-mojito.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Kiwi Mojito",
//             "id": 3972,
//             "uid": "Mzk3Mg==",
//             "image": {
//               "label": "Kiwi Mojito",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/i/kiwi-mojito.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Kiwi Mojito",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/k/i/kiwi-mojito.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Phúc Bồn Tử Mojito",
//             "id": 3971,
//             "uid": "Mzk3MQ==",
//             "image": {
//               "label": "Phúc Bồn Tử Mojito",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/h/phuc-bon-tu-mojito.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Phúc Bồn Tử Mojito",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/h/phuc-bon-tu-mojito.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Phúc Bồn Tử Cocktail",
//             "id": 3970,
//             "uid": "Mzk3MA==",
//             "image": {
//               "label": "Phúc Bồn Tử Cocktail",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/h/phuc-bon-tu-cocktail.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Phúc Bồn Tử Cocktail",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/p/h/phuc-bon-tu-cocktail.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 59000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Dưa Lưới Cocktail",
//             "id": 3969,
//             "uid": "Mzk2OQ==",
//             "image": {
//               "label": "Dưa Lưới Cocktail",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/u/dua-luoi-cocktail.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Dưa Lưới Cocktail",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/u/dua-luoi-cocktail.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 59000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo 2 ly (Sơ ri & Thanh Long)",
//             "id": 3968,
//             "uid": "Mzk2OA==",
//             "image": {
//               "label": "Combo 2 ly (Sơ ri & Thanh Long)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo-2-ly-sori-thanh-long.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo 2 ly (Sơ ri & Thanh Long)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo-2-ly-sori-thanh-long.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước Gạo Melon",
//             "id": 3967,
//             "uid": "Mzk2Nw==",
//             "image": {
//               "label": "Nước Gạo Melon",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc-gao-melon.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước Gạo Melon",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc-gao-melon.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước Gạo Pineapple",
//             "id": 3966,
//             "uid": "Mzk2Ng==",
//             "image": {
//               "label": "Nước Gạo Pineapple",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc-gao-pineapple-new_2_.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước Gạo Pineapple",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc-gao-pineapple-new_2_.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước Gạo Strawberry",
//             "id": 3965,
//             "uid": "Mzk2NQ==",
//             "image": {
//               "label": "Nước Gạo Strawberry",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc-gao-strawberry-new_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước Gạo Strawberry",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc-gao-strawberry-new_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Soju Melon Sangria - Darling",
//             "id": 3964,
//             "uid": "Mzk2NA==",
//             "image": {
//               "label": "Soju Melon Sangria - Darling",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/o/soju_melon_sangria_darling.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Soju Melon Sangria - Darling",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/o/soju_melon_sangria_darling.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Soju Mix Berry Sangria - Sweetheart",
//             "id": 3963,
//             "uid": "Mzk2Mw==",
//             "image": {
//               "label": "Soju Mix Berry Sangria - Sweetheart",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/o/soju_mix_berry_sangria_sweetheart.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Soju Mix Berry Sangria - Sweetheart",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/o/soju_mix_berry_sangria_sweetheart.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 79000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mocktail Chanh dây",
//             "id": 3962,
//             "uid": "Mzk2Mg==",
//             "image": {
//               "label": "Mocktail Chanh dây",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mocktail_chanh_day.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mocktail Chanh dây",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mocktail_chanh_day.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mocktail Táo",
//             "id": 3961,
//             "uid": "Mzk2MQ==",
//             "image": {
//               "label": "Mocktail Táo",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mocktail_tao.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mocktail Táo",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mocktail_tao.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Mocktail Dâu",
//             "id": 3960,
//             "uid": "Mzk2MA==",
//             "image": {
//               "label": "Mocktail Dâu",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mocktail_dau.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Mocktail Dâu",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/m/o/mocktail_dau.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước Uống 82x Collagen Kakemono",
//             "id": 3959,
//             "uid": "Mzk1OQ==",
//             "image": {
//               "label": "Nước Uống 82x Collagen Kakemono",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_uong_82x_collagen_kakemono.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước Uống 82x Collagen Kakemono",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_uong_82x_collagen_kakemono.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 59000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Coca Cola Zero Sleek Can 320ml",
//             "id": 3958,
//             "uid": "Mzk1OA==",
//             "image": {
//               "label": "Coca Cola Zero Sleek Can 320ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/coca_cola_zero_sleek_can_320ml.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Coca Cola Zero Sleek Can 320ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/coca_cola_zero_sleek_can_320ml.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sprite Sleek Can 320ml",
//             "id": 3957,
//             "uid": "Mzk1Nw==",
//             "image": {
//               "label": "Sprite Sleek Can 320ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/p/sprite_sleek_can_320ml.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sprite Sleek Can 320ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/p/sprite_sleek_can_320ml.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Coca Sleek Can 320ml",
//             "id": 3956,
//             "uid": "Mzk1Ng==",
//             "image": {
//               "label": "Coca Sleek Can 320ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/coca_sleek_can_320ml.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Coca Sleek Can 320ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/coca_sleek_can_320ml.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Sprite Tươi (Ly)",
//             "id": 3955,
//             "uid": "Mzk1NQ==",
//             "image": {
//               "label": "Sprite Tươi (Ly)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/p/sprite_tuoi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Sprite Tươi (Ly)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/p/sprite_tuoi.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 30000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Coca Cola Tươi (Ly)",
//             "id": 3954,
//             "uid": "Mzk1NA==",
//             "image": {
//               "label": "Coca Cola Tươi (Ly)",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/coca_cola_tuoi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Coca Cola Tươi (Ly)",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/coca_cola_tuoi.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 30000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bia Mala Mania",
//             "id": 3953,
//             "uid": "Mzk1Mw==",
//             "image": {
//               "label": "Bia Mala Mania",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia-mala-mania.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bia Mala Mania",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia-mala-mania.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bia Happy Kichi",
//             "id": 3952,
//             "uid": "Mzk1Mg==",
//             "image": {
//               "label": "Bia Happy Kichi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia-happy-kichi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bia Happy Kichi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia-happy-kichi.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bia Gogo GoGi",
//             "id": 3951,
//             "uid": "Mzk1MQ==",
//             "image": {
//               "label": "Bia Gogo GoGi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia-gogogogi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bia Gogo GoGi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia-gogogogi.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 49000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Strongbow Peach 330ml",
//             "id": 3950,
//             "uid": "Mzk1MA==",
//             "image": {
//               "label": "Strongbow Peach 330ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/t/strongbow-peach-can-330ml.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Strongbow Peach 330ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/t/strongbow-peach-can-330ml.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 45000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bia Tiger Platinum Wheat Lager",
//             "id": 3949,
//             "uid": "Mzk0OQ==",
//             "image": {
//               "label": "Bia Tiger Platinum Wheat Lager",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia_tiger_platinum_wheat_lager.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bia Tiger Platinum Wheat Lager",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia_tiger_platinum_wheat_lager.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bia Heineken 0.0",
//             "id": 3947,
//             "uid": "Mzk0Nw==",
//             "image": {
//               "label": "Bia Heineken 0.0",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia-heineken-can-00.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bia Heineken 0.0",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia-heineken-can-00.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rượu Him Soju classic 360ml/ Chai",
//             "id": 546,
//             "uid": "NTQ2",
//             "image": {
//               "label": "Rượu Him Soju classic 360ml/ Chai",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18106_Ruou_Him_soju_classic_1_1.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rượu Him Soju classic 360ml/ Chai",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18106_Ruou_Him_soju_classic_1_1.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 139000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rượu Him Soju đào 360ml/ Chai",
//             "id": 545,
//             "uid": "NTQ1",
//             "image": {
//               "label": "Rượu Him Soju đào 360ml/ Chai",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18105_ruou_Him_soju_dao_1_1.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rượu Him Soju đào 360ml/ Chai",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18105_ruou_Him_soju_dao_1_1.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 139000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rượu Him Soju nho 360ml/ Chai",
//             "id": 544,
//             "uid": "NTQ0",
//             "image": {
//               "label": "Rượu Him Soju nho 360ml/ Chai",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18104_Ruou_Him_Soju_nho_1_1.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rượu Him Soju nho 360ml/ Chai",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18104_Ruou_Him_Soju_nho_1_1.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 139000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rượu Him Soju dưa hấu 360ml/ Chai",
//             "id": 543,
//             "uid": "NTQz",
//             "image": {
//               "label": "Rượu Him Soju dưa hấu 360ml/ Chai",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18103_Ruou_Him_Soju_dua_hau_1_1.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rượu Him Soju dưa hấu 360ml/ Chai",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18103_Ruou_Him_Soju_dua_hau_1_1.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 139000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rượu Him Soju vải 360ml/ Chai",
//             "id": 542,
//             "uid": "NTQy",
//             "image": {
//               "label": "Rượu Him Soju vải 360ml/ Chai",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18026_Ruou_Him_Soju_vai_1_1.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rượu Him Soju vải 360ml/ Chai",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/8/18026_Ruou_Him_Soju_vai_1_1.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 139000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rượu mơ Haruka 180ml",
//             "id": 540,
//             "uid": "NTQw",
//             "image": {
//               "label": "Rượu mơ Haruka 180ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/7/0/7062_Ruou_mo_Haruka_180_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rượu mơ Haruka 180ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/7/0/7062_Ruou_mo_Haruka_180_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 89000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước Gạo LM Makgeolli Banana 4 độ 750",
//             "id": 538,
//             "uid": "NTM4",
//             "image": {
//               "label": "Nước Gạo LM Makgeolli Banana 4 độ 750",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/2/1274_Ruou_gao_Makgeolli_Chuoi_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước Gạo LM Makgeolli Banana 4 độ 750",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/2/1274_Ruou_gao_Makgeolli_Chuoi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 149000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Rượu Vodka cá sấu xanh 300ml",
//             "id": 536,
//             "uid": "NTM2",
//             "image": {
//               "label": "Rượu Vodka cá sấu xanh 300ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/0/1014_Ruou_Vodka_Ca_sau_xanh_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Rượu Vodka cá sấu xanh 300ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/0/1014_Ruou_Vodka_Ca_sau_xanh_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 119000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Soju Sangria",
//             "id": 531,
//             "uid": "NTMx",
//             "image": {
//               "label": "Combo Soju Sangria",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo-soju-sangria-new_1_.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Soju Sangria",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3122_Combo_Soju_Sangria_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 129000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo 2 ly nước gạo",
//             "id": 530,
//             "uid": "NTMw",
//             "image": {
//               "label": "Combo 2 ly nước gạo",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/c/o/combo-2-ly-nuoc-gao-new.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo 2 ly nước gạo",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3114_Combo_2_ly_nuoc_gao_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 89000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Combo Mocktail Trái Cây",
//             "id": 529,
//             "uid": "NTI5",
//             "image": {
//               "label": "Combo Mocktail Trái Cây",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3113_Combo_Mocktail_Trai_cay_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Combo Mocktail Trái Cây",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/3/1/3113_Combo_Mocktail_Trai_cay_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 89000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước ép Sơ Ri Dưa Lưới",
//             "id": 528,
//             "uid": "NTI4",
//             "image": {
//               "label": "Nước ép Sơ Ri Dưa Lưới",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_ep_so_ri_dua_luoi.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước ép Sơ Ri Dưa Lưới",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2729_Nuoc_ep_sori_dua_luoi_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước ép Sơ Ri Dâu Tây",
//             "id": 527,
//             "uid": "NTI3",
//             "image": {
//               "label": "Nước ép Sơ Ri Dâu Tây",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_ep_so_ri_dau_tay_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước ép Sơ Ri Dâu Tây",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_ep_so_ri_dau_tay_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước ép thanh long",
//             "id": 526,
//             "uid": "NTI2",
//             "image": {
//               "label": "Nước ép thanh long",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_ep_thanh_long.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước ép thanh long",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/7/2727_Nuoc_ep_thanh_long_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước ép Sơ ri",
//             "id": 525,
//             "uid": "NTI1",
//             "image": {
//               "label": "Nước ép Sơ ri",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_ep_so_ri.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước ép Sơ ri",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/5/1502_Nuoc_ep_sori_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước cà rốt",
//             "id": 524,
//             "uid": "NTI0",
//             "image": {
//               "label": "Nước cà rốt",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/3/1365_Nuoc_ca_rot_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước cà rốt",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/3/1365_Nuoc_ca_rot_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước chanh tươi/Nước chanh",
//             "id": 523,
//             "uid": "NTIz",
//             "image": {
//               "label": "Nước chanh tươi/Nước chanh",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/3/1359_Nuoc_chanh_tuoi_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước chanh tươi/Nước chanh",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/3/1359_Nuoc_chanh_tuoi_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước chanh dây/Chanh leo",
//             "id": 522,
//             "uid": "NTIy",
//             "image": {
//               "label": "Nước chanh dây/Chanh leo",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_chanh_day.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước chanh dây/Chanh leo",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/8/3/836_Nuoc_chanh_day_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước cam nguyên chất/Nước Cam Tươi",
//             "id": 521,
//             "uid": "NTIx",
//             "image": {
//               "label": "Nước cam nguyên chất/Nước Cam Tươi",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_ep_so_ri_dau_tay.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước cam nguyên chất/Nước Cam Tươi",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/8/1/817_Nuoc_cam_nguyen_chat_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Nước dưa hấu/Dưa hấu ép",
//             "id": 520,
//             "uid": "NTIw",
//             "image": {
//               "label": "Nước dưa hấu/Dưa hấu ép",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/n/u/nuoc_dua_hau.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Nước dưa hấu/Dưa hấu ép",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/8/1/816_Nuoc_dua_hau_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Soda chanh đường",
//             "id": 519,
//             "uid": "NTE5",
//             "image": {
//               "label": "Soda chanh đường",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/o/soda_chanh_duong.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Soda chanh đường",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/1/3/13_Soda_chanh_duong_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Fanta Sleek can 320ml",
//             "id": 518,
//             "uid": "NTE4",
//             "image": {
//               "label": "Fanta Sleek can 320ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/5/7/5768_Fanta_Sleek_can_320ml_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Fanta Sleek can 320ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/5/7/5768_Fanta_Sleek_can_320ml_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Coca-Cola Light sleek Can 320ml",
//             "id": 517,
//             "uid": "NTE3",
//             "image": {
//               "label": "Coca-Cola Light sleek Can 320ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/5/7/5766_Coca_Cola_Light_sleek_Can_320ml_1_2.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Coca-Cola Light sleek Can 320ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/5/7/5766_Coca_Cola_Light_sleek_Can_320ml_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Coca-Cola Plus Sleek Can 320ml",
//             "id": 516,
//             "uid": "NTE2",
//             "image": {
//               "label": "Coca-Cola Plus Sleek Can 320ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/5/7/5762_Coca_Cola_Plus_Sleek_Can_320ml_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Coca-Cola Plus Sleek Can 320ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/5/7/5762_Coca_Cola_Plus_Sleek_Can_320ml_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Dasani Purified PET 500ml",
//             "id": 513,
//             "uid": "NTEz",
//             "image": {
//               "label": "Dasani Purified PET 500ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/8/989_Dasani_Purified_PET_500ml_1_1.jpg",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Dasani Purified PET 500ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/9/8/989_Dasani_Purified_PET_500ml_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 30000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bia Heineken Lon 330ml",
//             "id": 509,
//             "uid": "NTA5",
//             "image": {
//               "label": "Bia Heineken Lon 330ml",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia_heineken_lon_330ml.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bia Heineken Lon 330ml",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/static/version1668068701/frontend/Magento/luma/vi_VN/Magento_Catalog/images/product/placeholder/small_image.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 36000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Tiger Bạc Lon 330ml - Tiger Crystal lon",
//             "id": 508,
//             "uid": "NTA4",
//             "image": {
//               "label": "Tiger Bạc Lon 330ml - Tiger Crystal lon",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/i/tiger_bac_lon_330ml_tiger_crystal_lon_1.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Tiger Bạc Lon 330ml - Tiger Crystal lon",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/t/i/tiger_bac_lon_330ml_tiger_crystal_lon_1.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 36000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Strongbow Dark Fruit 330ml/Lon",
//             "id": 507,
//             "uid": "NTA3",
//             "image": {
//               "label": "Strongbow Dark Fruit 330ml/Lon",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/t/strongbow-dark-fruit-can-330ml.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Strongbow Dark Fruit 330ml/Lon",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/6/6/665_Strongbow_Dark_Fruit_330ml_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 45000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Strongbow Red Berries 330ml/Lon",
//             "id": 506,
//             "uid": "NTA2",
//             "image": {
//               "label": "Strongbow Red Berries 330ml/Lon",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/t/strongbow-red-berries-can-330ml.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Strongbow Red Berries 330ml/Lon",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/6/6/664_Strongbow_AC_Red_Berries_chai_330_ml_3_1.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 45000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Strongbow Gold Apple 330ml/Lon",
//             "id": 504,
//             "uid": "NTA0",
//             "image": {
//               "label": "Strongbow Gold Apple 330ml/Lon",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/t/strongbow-gold-apple-can-330ml.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Strongbow Gold Apple 330ml/Lon",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/t/strongbow-gold-apple-can-330ml.png",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 45000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           },
//           {
//             "name": "Bia Heineken Silver 330ml/lon",
//             "id": 503,
//             "uid": "NTAz",
//             "image": {
//               "label": "Bia Heineken Silver 330ml/lon",
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/b/i/bia_heineken_silver_330ml_1.png",
//               "position": null,
//               "__typename": "ProductImage"
//             },
//             "small_image": {
//               "disabled": null,
//               "label": "Bia Heineken Silver 330ml/lon",
//               "position": null,
//               "url":
//               "https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/6/5/650_Bia_Heineken_Silver_3_2.jpg",
//               "__typename": "ProductImage"
//             },
//             "__typename": "SimpleProduct",
//             "price_range": {
//               "minimum_price": {
//                 "final_price": {
//                   "currency": "VND",
//                   "value": 39000,
//                   "__typename": "Money"
//                 },
//                 "__typename": "ProductPrice"
//               },
//               "__typename": "PriceRange"
//             },
//             "description": {"html": "", "__typename": "ComplexTextValue"},
//             "short_description": {"html": "", "__typename": "ComplexTextValue"}
//           }
//         ],
//         "page_info": {
//           "current_page": 1,
//           "page_size": 200,
//           "total_pages": 1,
//           "__typename": "SearchResultPageInfo"
//         },
//         "total_count": 64,
//         "__typename": "CategoryProducts"
//       },
//       "__typename": "CategoryTree"
//     }
//   ]
// };
