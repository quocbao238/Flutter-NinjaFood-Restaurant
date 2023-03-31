class PopularMenuItem {
  final String? image;
  final String? name;

  PopularMenuItem({
    required this.image,
    required this.name,
  });

  static List<PopularMenuItem> popularMenuList = [
    PopularMenuItem(
      image:
          'https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/d/e/de_suon_bo_my_sot_obathan_150gr_1.jpg',
      name: 'Thịt bò',
    ),
    PopularMenuItem(
      image:
          'https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/u/suon_heo_my_sot_galbi_1.jpg',
      name: 'Thịt heo',
    ),
    PopularMenuItem(
      image:
          'https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/s/a/salad-cu-sen-new.jpg',
      name: 'Salad',
    ),
    PopularMenuItem(
      image:
          'https://brand-pcms.ggg.systems/media/catalog/product/cache/fccf9bc1c56510f6f2e84ded9c30a375/2/6/2643_Com_tron_bat_da_han_quoc_sot_gogi_1_2.jpg',
      name: 'Cơm',
    ),
  ];
}
