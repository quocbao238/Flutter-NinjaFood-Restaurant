import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_admin/category/controller/admin_edit_product_controller.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/layout/mobile/edit_profile_mobile_view/edit_profile_mobile_view.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class AdminEditProductMobileView extends GetView<AdminEditProductScreenController> {
  const AdminEditProductMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);

    return AppScaffoldBackgroundImage.splash(
        appBarWidget: CustomAppBar.back(
          title: 'Chỉnh sửa thông tin',
        ),
        body: AppPadding.medium(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      AppNetworkImage(
                        url: controller.productImage ?? '',
                        borderRadius: 18,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.6,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                  backgroundColor: MaterialStateProperty.all(Color(0xFFF9A84D).withOpacity(0.4)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                            child: Icon(FontAwesomeIcons.penToSquare, size: 16.0, color: ThemeColors.orangeColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextInputTitle(title: 'Tên'.tr, paddingLeft: AppGapSize.none),
                AppTextFormField(
                    hintText: 'Edit_Profile_FirstName'.tr,
                    textStyle: textStyle,
                    maxLines: null,
                    decoration: _decoration(controller.productNameError.value, context),
                    controller: controller.productNameController),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      TextInputTitle(title: 'Giá (VND)'.tr, paddingLeft: AppGapSize.none),
                      Expanded(
                        child: AppPadding(
                          padding: AppEdgeInsets.only(
                              top: AppGapSize.regular, bottom: AppGapSize.small, right: AppGapSize.small),
                          child: Obx(() {
                            return AppText.bodyMedium(
                                text: Common.formatMoney(controller.newPrice.value.toString()) + ' VND',
                                color: ThemeColors.textPriceColor,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.right);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                AppTextFormField(
                    hintText: 'Giá (VND)'.tr,
                    textStyle: textStyle,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: _decoration(controller.productPriceError.value, context),
                    controller: controller.productPriceController),
                TextInputTitle(title: 'Chi tiết về món ăn'.tr, paddingLeft: AppGapSize.none),
                AppTextFormField(
                    hintText: 'Chi tiết về món ăn'.tr,
                    textStyle: textStyle,
                    maxLines: null,
                    decoration: _decoration(controller.productDescriptionError.value, context),
                    controller: controller.productDescriptionController),
                SafeArea(
                  child: AppPadding(
                    padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                    child: Obx(() {
                      return Center(
                        child: AnimationButton(
                          ratioWidthButton: 0.95,
                          ratioWidthDone: 0.65,
                          ratioWidthLoading: 0.5,
                          textButton: 'Edit_Profile_Update'.tr,
                          onDone: () {},
                          loading: controller.loading.value,
                          onPressed: () => controller.onPressedUpdate(),
                          textDone: 'Edit_Profile_Update_Success'.tr,
                          textLoading: 'Edit_Profile_Updating'.tr,
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  InputDecoration _decoration(String? errorText, BuildContext context) => InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      fillColor: Colors.transparent,
      errorText: errorText,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6), width: 2.0)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: ThemeColors.primaryColor, width: 2.0)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: ThemeColors.textRedColor, width: 3.0)));
}
