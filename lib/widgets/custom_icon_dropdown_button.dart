import 'package:flutter/material.dart';
import 'package:poke_app/widgets/custom_icon.dart';

class CustomIconDropdownButton extends StatefulWidget {
  List<String> items;
  Function(String?) onChange;
  CustomIcon icon;
  TextStyle? style;
  Function(String)? onTap;
  CustomIconDropdownButton({Key? key, required this.icon, required this.items, required this.onChange, this.style, this.onTap}) : super(key: key);

  @override
  State<CustomIconDropdownButton> createState() => _CustomIconDropdownButtonState();
}

class _CustomIconDropdownButtonState extends State<CustomIconDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: widget.icon,
      onSelected: widget.onTap,
      itemBuilder: (BuildContext context) {
        return widget.items.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
    // return DropdownButton<String>(items: widget.items.map<DropdownMenuItem<String>>((String value) {
    //   return DropdownMenuItem<String>(
    //     value: value,
    //     onTap: (){
    //       if(widget.onTap != null){
    //         widget.onTap!(value);
    //       }
    //     },
    //     child: CustomText(textToDisplay: value, textStyle: widget.style,),
    //   );
    // }).toList(),
    //   onChanged: widget.onChange,
    //   underline: const SizedBox.shrink(),
    //   isDense: true,
    //   elevation: 4,
    //   icon: widget.icon,);
  }
}

