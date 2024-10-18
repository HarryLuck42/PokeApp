import 'package:flutter/material.dart';
import 'package:poke_app/core/extention/extention.dart';

import '../core/constraint/asset_path.dart';
import 'custom_icon.dart';

class CustomFloatButton extends StatelessWidget {
  Function? onClick;
  String? icon;
  CustomFloatButton({Key? key, this.onClick, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(35)),
      child: InkWell(
        onTap: (){
          if(onClick != null){
            onClick!();
          }
        },
        highlightColor: context.getTheme().colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: context.getTheme().colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(35))
          ),
          child: CustomIcon(
            width: 35,
            height: 35,
            iconData: icon != null ? '${AssetPath.vector}$icon.svg' : '${AssetPath.vector}ic_plus.svg',
            defaultColor: false,
            color: Colors.white,),
        ),
      ),
    );
  }
}
