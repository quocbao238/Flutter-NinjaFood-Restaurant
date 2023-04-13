import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class CircleAvatarWithEditButton extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onEditPressed;

  const CircleAvatarWithEditButton({
    required this.imageUrl,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final avatarSize = screenSize.width * 0.2;
    final ratioSize = 3.2;

    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: avatarSize,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                  radius: avatarSize / ratioSize,
                  backgroundColor: ThemeColors.labelDarkColor.withOpacity(0.7),
                  child: SizedBox(
                    width: avatarSize / ratioSize,
                    height: avatarSize / ratioSize,
                    child: AppIcons.camera()) // change this children
                  ))
        ],
      ),
    );
  }
}