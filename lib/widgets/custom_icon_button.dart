import 'package:flutter/material.dart';
import 'package:poke_app/widgets/custom_icon.dart';

class CustomIconButton extends StatelessWidget {
  final String iconData;
  final Function? onPressed;
  final EdgeInsets padding;
  final AlignmentGeometry alignment;
  final bool defaultColor;
  final double? height;
  final double? width;
  final Color? color;

  const CustomIconButton(
      {Key? key,
        required this.iconData,
        required this.onPressed,
        this.color,
        this.height,
        this.width,
        this.alignment = Alignment.center,
        this.defaultColor = false,
        this.padding = const EdgeInsets.all(8.0)})
      :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      onPressed: onPressed as void Function()?,
      alignment: alignment,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      icon: CustomIcon(
        iconData: iconData,
        defaultColor: defaultColor,
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}