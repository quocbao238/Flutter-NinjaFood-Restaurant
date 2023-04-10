import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const AppNetworkImage({Key? key, required this.url, this.fit, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => DecoratedBox(
          decoration: BoxDecoration(image: DecorationImage(image: imageProvider, fit: fit ?? BoxFit.fill))),
      placeholder: (context, url) => AppLoading(isLoading: true),
      errorWidget: (context, url, error) => Icon(Icons.error, color: Theme.of(context).colorScheme.onError),
    );
  }
}
