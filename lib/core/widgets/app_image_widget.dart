import 'package:flutter/widgets.dart';

class AppImage extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImage({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(asset, width: width, height: height, fit: fit);
  }
}
