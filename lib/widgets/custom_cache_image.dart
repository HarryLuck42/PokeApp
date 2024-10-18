import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/core/base/base_state.dart';
import 'package:poke_app/core/extention/extention.dart';

import 'custom_loading.dart';

class CustomCacheImage extends StatefulWidget {
  final String? imageUrl;
  final String? cacheKey;
  final double? width;
  final double? height;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final double widthPlaceHolder;
  final double heightPlaceHolder;
  final Widget? placeHolderWidget;
  final Widget emptyWidget;
  final Map<String, String>? headers;
  final Widget Function(BuildContext context, String url, dynamic error, bool connection) errorWidget;
  final Widget Function(BuildContext context, ImageProvider imageProvider) imageBuilder;
  const CustomCacheImage({Key? key,
    this.headers,
    this.cacheKey,
    this.width,
    this.height,
    this.imageUrl,
    required this.errorWidget,
    required this.imageBuilder,
    this.memCacheWidth,
    this.memCacheHeight,
    this.placeHolderWidget,
    required this.emptyWidget,
    this.widthPlaceHolder = 35,
    this.heightPlaceHolder = 35,}): super(key: key);

  @override
  State<CustomCacheImage> createState() => _CustomCacheImageState();
}

class _CustomCacheImageState extends State<CustomCacheImage> with BaseState{


  bool connection = true;
  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration.zero, () async{
      connection = await helper.checkConnections();
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.imageUrl;
    if ((imageUrl ?? '').isNotEmpty || (imageUrl ?? '').isUrlLink()) {
      return (imageUrl ?? '').isNotEmpty
          ? CachedNetworkImage(
        width: widget.width,
        height: widget.height,
        imageUrl: imageUrl ?? '',
        memCacheHeight: 60,
        memCacheWidth: 45,
        imageBuilder: widget.imageBuilder,
        errorWidget: (context, url, error){
          return widget.errorWidget(context, url, error, connection);
        },
        placeholder: (context, url) =>
        widget.placeHolderWidget ??
            UnconstrainedBox(
              child: Container(
                alignment: Alignment.center,
                width: widget.widthPlaceHolder * context.scaleDiagonal(),
                height: widget.heightPlaceHolder * context.scaleDiagonal(),
                child: const CustomLoading(),
              ),
            ),
      )
          : widget.emptyWidget;
    } else {
      return widget.emptyWidget;
    }
  }


}
