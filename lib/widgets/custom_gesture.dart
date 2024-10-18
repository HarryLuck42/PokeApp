import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';

class CustomGesture extends StatelessWidget {
  final double? height;
  final double? width;
  final Function() onTap;
  final Widget child;
  final double? radius;
  final Color? splashColor;
  const CustomGesture({Key? key, this.width, this.height, required this.onTap, required this.child, this.radius, this.splashColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: context.getColorScheme().onSecondary,
            borderRadius: BorderRadius.circular(radius ?? 0.0),

        ),
        child: InkWell(
            onTap: onTap,
            splashColor: splashColor ?? context.getColorScheme().primary,
            borderRadius: BorderRadius.circular(radius ?? 0.0),
            child: child
        ),
      ),
    );
  }
}
