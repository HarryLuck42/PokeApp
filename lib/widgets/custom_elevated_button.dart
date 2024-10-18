import 'package:flutter/material.dart';
import 'package:poke_app/widgets/custom_loading.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double height;
  final Function? function;
  final ButtonStyle? buttonStyle;
  final bool loading;

  const CustomElevatedButton({Key? key,
    required this.child,
    required this.width,
    required this.height,
    required this.function,
    this.buttonStyle,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: ElevatedButton(
          child: !loading ? child : CustomLoading(),
          style: buttonStyle,
          onPressed: function as void Function()?,
        ),
      ),
    );
  }
}
