
import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class RowTextValueWidget extends StatelessWidget {
  final String title;
  final String value;

  const RowTextValueWidget({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.only(top: AppGapSize.small),
      child: Row(
        children: [
          AppText.bodySmall(text: title, fontWeight: FontWeight.normal, maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(width: AppGapSize.small.size),
          Expanded(
            child: AppText.bodySmall(
                text: value,
                textAlign: TextAlign.end,
                fontWeight: FontWeight.bold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
