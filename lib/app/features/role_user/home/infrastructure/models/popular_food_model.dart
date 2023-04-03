class PopularFoodItem  {
  final String? image;
  final String? name;
  final int? price;

  PopularFoodItem({
    required this.image,
    required this.name,
    required this.price,
  });

  static List<PopularFoodItem> popularFoodList = [
    PopularFoodItem(
      image:
          'https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/8/2864_Nac_vai_heo_sot_Obathan_1_2.jpg',
      name: 'Herbal Pancake',
      price: 7,
    ),
    PopularFoodItem(
      image:
          'https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_tuoi_mat_ong.jpg',
      name: 'Fruit Salad',
      price: 10,
    ),
    PopularFoodItem(
      image:
          'https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/4/2428_Com_trang_1_2.jpg',
      name: 'Cơm trắng',
      price: 1,
    ),
  ];
}
