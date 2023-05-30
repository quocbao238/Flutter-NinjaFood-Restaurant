import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/category/controllers/category_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/widgets.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class CategoryMobileView extends GetView<CategoryScreenController> {
  const CategoryMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(title: controller.currentMenu.name ?? ''),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: AppLoading(isLoading: true));
        }
        return AppPadding.medium(
            child: SingleChildScrollView(
                child: Obx(() => ProductList(productList: controller.products.toList()))));
      }),
    );
  }
}
