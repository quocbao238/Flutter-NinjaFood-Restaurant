import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/category/controllers/category_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/layout/mobile/widgets/widgets.dart';

class CategoryMobileView extends GetView<CategoryScreenController> {
  const CategoryMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffoldBackgroundImage.pattern(
        appBarWidget:
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          AppButtonBack(onPressed: () => Get.back()),
          Expanded(
            child: AppPadding(
                padding: AppEdgeInsets.only(
                    top: AppGapSize.paddingMedium,
                    bottom: AppGapSize.regular,
                    right: AppGapSize.paddingMedium),
                child: AppText.headlineSmall(
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    text: controller.currentMenu.name ?? '')),
          ),
        ]),
        // onPressBackButton: () => Get.back(),

        body: Obx(() {
          final isLoading = controller.loading.value;
          if (isLoading) {
            return const Center(child: AppLoading(isLoading: true));
          }
          return AppPadding.medium(
              child: SingleChildScrollView(
                  child: ProductList(productList: controller.products)));
        }),
      ),
    );
  }
}
