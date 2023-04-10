import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';

class BoxViaEmail extends StatelessWidget {
  const BoxViaEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(-4, 4),
          ),
          BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.2), blurRadius: 8, offset: Offset(4, -4))
        ],
      ),
      child: AppPadding.regular(
        child: Row(
          children: [
            SizedBox(height: 40, width: 40, child: AppIcons.email()),
            AppPadding(
              padding: AppEdgeInsets.only(left: AppGapSize.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyLarge(
                    text: 'Via email:'.tr,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF828282),
                  ),
                  AppText.bodyLarge(
                    text: '•••• @gmail.com'.tr,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF09051C),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
