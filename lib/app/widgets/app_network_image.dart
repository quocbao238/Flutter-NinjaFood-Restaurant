part of 'widgets.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final double borderRadius;

  const AppNetworkImage({Key? key, required this.url, this.fit, this.width, this.height, this.borderRadius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
            width: width,
            height: height,
            decoration: BoxDecoration(image: DecorationImage(image: imageProvider, fit: fit ?? BoxFit.cover))),
        placeholder: (context, url) => AppLoading(isLoading: true),
        errorWidget: (context, url, error) => Icon(Icons.error, color: Theme.of(context).colorScheme.onError),
      ),
    );
  }
}
