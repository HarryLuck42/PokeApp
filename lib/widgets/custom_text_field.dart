import 'package:flutter/material.dart';
import 'package:poke_app/core/constraint/asset_path.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/core/themes/app_colors.dart';
import 'package:poke_app/widgets/custom_icon_button.dart';

class CustomTextField extends StatelessWidget {
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
  final String? errorText;
  final double? heightText;
  final InputDecoration? inputDecoration;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final bool autoFocus;
  final Widget? icon;
  final int? minLines;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    this.onSubmitted,
    this.onChanged,
    this.controller,
    this.onTap,
    this.hintText,
    this.errorText,
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
    this.icon,
    this.maxLines,
    this.minLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        readOnly: readOnly,
        focusNode: focusNode,
        controller: controller,
        autofocus: autoFocus,
        style: context.getTextTheme().bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        decoration: inputDecoration ??
            InputDecoration(
                suffixIcon: onPressedRightIcon != null ? CustomIconButton(
                  defaultColor: false,
                  onPressed: onPressedRightIcon,
                  iconData: "${AssetPath.vector}filter.svg",
                ) : null,
                prefixIcon: icon,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                hintText: hintText,
                errorText: errorText,
                filled: true,
                fillColor: context.getColorScheme().surface,
                contentPadding: contentPadding,
                border: InputBorder.none,
                // focusedBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 2, color: context.getTheme().colorScheme.primary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 1, color: context.getTheme().colorScheme.secondary),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 1, color: Red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 2, color: Red),
                ),
                disabledBorder: InputBorder.none,
                counterText: ''),
        textInputAction: TextInputAction.search,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        textAlign: textAlign,
        keyboardType: textInputType,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
