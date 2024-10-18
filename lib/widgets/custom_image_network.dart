import 'package:flutter/material.dart';

import '../core/constraint/asset_path.dart';
import 'custom_cache_image.dart';

class CustomImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  const CustomImageNetwork({super.key, required this.imageUrl, required this.width, required this.height, this.fit = BoxFit.fitHeight});

  @override
  Widget build(BuildContext context) {
    return CustomCacheImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      errorWidget: (context, url, error, connection) {
        if(error.toString().contains("400")){
          return Image.asset(
            "${AssetPath.image}broken_image.png",
            width: width,
            height: height,
            fit: BoxFit.contain,
          );
        }
        if (connection && url.isNotEmpty) {
          return Image.network(
            url,
            width: width,
            height: height,
            fit: fit,
          );
        }
        return Image.asset(
          "${AssetPath.image}broken_image.png",
          width: width,
          height: height,
          fit: BoxFit.contain,
        );
      },
      imageBuilder: (context, image) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: fit),
          ),
        );
      },
      emptyWidget: Image.asset(
        "${AssetPath.image}broken_image.png",
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
