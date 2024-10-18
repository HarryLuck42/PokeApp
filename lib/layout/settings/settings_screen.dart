
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/constraint/spacer.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/initial/bloc/app_bloc.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/widgets/custom_app_bar.dart';
import 'package:poke_app/widgets/custom_gesture.dart';
import 'package:poke_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../core/themes/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppInitial>(builder: (context, state) {
      final isLight = state.themeData == appLightTheme();
      return Scaffold(
        appBar: CustomAppBar(context, lang(context).settings ?? "Settings"),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      textToDisplay: !isLight
                          ? (lang(context).dark ?? "Dark")
                          : (lang(context).light ?? "Light"),
                      textStyle: context.getTextTheme().titleSmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  fourPx,
                  Switch(
                      value: isLight,
                      onChanged: (check) {
                        if (check) {
                          context.read<AppBloc>().add(ChangeMode(mode: appLightTheme()));
                        } else {
                          context.read<AppBloc>().add(ChangeMode(mode: appDarkTheme()));
                        }
                      })
                ],
              ),
            ),
            Container(height: 1, width: double.infinity, color: context.getColorScheme().onSecondary,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      textToDisplay: (lang(context).language ?? "Language"),
                      textStyle: context.getTextTheme().titleSmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  fourPx,
                  _languageSelection(context, "Bahasa Indonesia", state.lang == "id", (){
                    context.read<AppBloc>().add(ChangeLocale(lang: "id"));
                  }),
                  eightPx,
                  _languageSelection(context, "English", state.lang == "en", (){
                    context.read<AppBloc>().add(ChangeLocale(lang: "en"));
                  }),
                ],
              ),
            ),
            Container(height: 1, width: double.infinity, color: context.getColorScheme().onSecondary,),
          ],
        )),
      );
    });
  }

  Widget _languageSelection(
      BuildContext context, String text, bool isSelected, Function() onTap) {
    return CustomGesture(
      onTap: onTap,
      height: 30,
      radius: 15,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: isSelected
                ? context.getColorScheme().onPrimaryFixed
                : context.getColorScheme().primaryFixed,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 2.6,
                spreadRadius: 0,
                offset: Offset(
                  1.95,
                  1.95,
                ),
              ),
            ]),
        child: CustomText(
          textToDisplay: text,
          textStyle: context.getTextTheme().bodySmall?.copyWith(
              color: isSelected
                  ? context.getColorScheme().primaryFixed
                  : context.getColorScheme().onPrimaryFixed),
        ),
      ),
    );
  }
}
