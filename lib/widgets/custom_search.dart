import 'package:flutter/material.dart';
import 'package:poke_app/core/constraint/asset_path.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/widgets/custom_icon_button.dart';

class CustomSearch extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final Function? onPressedIcon;
  final Function? onPressedRightIcon;
  final TextEditingController? controller;
  final Function()? onTap;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final TextAlign textAlign;
  final String? hintText;
  final double? heightText;
  final InputDecoration? inputDecoration;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final bool autoFocus;

  const CustomSearch({
    Key? key,
    this.onSubmitted,
    this.onChanged,
    this.controller,
    this.onTap,
    this.hintText,
    this.contentPadding,
    this.onPressedIcon,
    this.onPressedRightIcon,
    this.heightText,
    this.focusNode,
    this.inputDecoration,
    this.textInputType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: TextField(
        readOnly: readOnly,
        focusNode: focusNode,
        controller: controller,
        autofocus: autoFocus,
        decoration: inputDecoration ??
            InputDecoration(
                suffixIcon: onPressedRightIcon != null ? CustomIconButton(
                  defaultColor: false,
                  onPressed: onPressedRightIcon,
                  iconData: "${AssetPath.vector}close.svg",
                ) : null,
                prefixIcon: CustomIconButton(
                  defaultColor: false,
                  onPressed: onPressedIcon,
                  iconData: "${AssetPath.vector}search.svg",
                ),
                hintStyle: Theme.of(context).textTheme.bodySmall,
                hintText: hintText,
                contentPadding: contentPadding,
                border: InputBorder.none,
                // focusedBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(width: 2, color: context.getTheme().colorScheme.primary),
                ),
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                counterText: ''),
        textInputAction: TextInputAction.search,
        maxLines: 1,
        textAlign: textAlign,
        keyboardType: textInputType,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
