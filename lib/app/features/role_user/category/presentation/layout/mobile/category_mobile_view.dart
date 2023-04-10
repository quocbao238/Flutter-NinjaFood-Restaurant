import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/category/controllers/category_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/product_view/product_list_view.dart';


class CategoryMobileView extends GetView<CategoryController> {
  const CategoryMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: Row(
        children: [
          AppButtonBack(onPressed: () => Get.back()),
          Expanded(
            child: AppPadding.medium(
                child: AppText.headlineSmall(
                    text: controller.currentMenu.name ?? '')),
          ),
          AppPadding(
              padding: const AppEdgeInsets.only(
                  top: AppGapSize.paddingMedium,
                  left: AppGapSize.paddingMedium,
                  right: AppGapSize.paddingMedium,
                  bottom: AppGapSize.regular),
              child: SizedBox(width: 45, height: 45)),
        ],
      ),
      // onPressBackButton: () => Get.back(),

      body: Obx(() {
        final isLoading = controller.loading.value;
        if (isLoading) {
          return const Center(child: AppLoading(isLoading: true));
        }
        return AppPadding.medium(
          child: SingleChildScrollView(
            child: ProductList(
              productList: controller.products,
            ),
          ),
        );
      }),
    );
  }
}
