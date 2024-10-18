import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/widgets/custom_text.dart';

class CustomRadioButton extends StatefulWidget {
  List<String> values;
  Function(String) onChange;
  CustomRadioButton({Key? key, required this.values, required this.onChange})
      : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  List<ItemRadio> radios = [];
  // String? current = null;

  @override
  void initState() {
    for (final value in widget.values) {
      radios.add(ItemRadio(title: value));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5,
      spacing: 10,
      children: radios
          .map((e) => _itemRadio(context, e, onClick: (item) {
                setState(() {
                  if (!item.isActive) {
                    final sort =
                        radios.where((element) => element.isActive).toList();
                    for (final data in sort) {
                      data.isActive = false;
                    }
                    final index = radios.indexOf(item);
                    radios[index].isActive = true;
                    widget.onChange(item.title);
                  }
                });
              }))
          .toList(),
    );
  }

  Widget _itemRadio(BuildContext ctx, ItemRadio item,
      {Function(ItemRadio)? onClick}) {
    final activeColor = ctx.getTheme().colorScheme.primary;
    final inactive = ctx.getTheme().colorScheme.tertiary;
    final borderColor =
        item.isActive ? ctx.getTheme().colorScheme.onBackground : activeColor;
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: item.isActive ? activeColor : inactive,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: InkWell(
          onTap: () {
            if (onClick != null) {
              onClick(item);
            }
          },
          splashColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: CustomText(
              textToDisplay: item.title,
              textStyle: ctx
                  .getTheme()
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: borderColor),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemRadio {
  bool isActive;
  String title;
  ItemRadio({this.isActive = false, required this.title});
}
