
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_app/initial/locale/languages.dart';

class AppLocale {
  AppLocale(this.locale);
  final Locale locale;

  late Map<String, String> _loadedLocalizedValues;

  static AppLocale of (BuildContext context) {
    return Localizations.of(context, AppLocale);
  }

  Future loadLang() async {
    String  langFile = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
    Map<String ,dynamic> loadedValues = jsonDecode(langFile);
    _loadedLocalizedValues = loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslated (String key) {
    if (_loadedLocalizedValues.containsKey(key)) {
      return _loadedLocalizedValues[key] ?? "";
    }
    return "";
  }
  static const LocalizationsDelegate<AppLocale> delegate  = _AppLocalDelegate();

  Map<String, String> getLocalizationMap(){
    return _loadedLocalizedValues;
  }
}

class  _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalDelegate() ;
  static const List<String> _jsonFiles = ["en" , "id"];

  @override
  bool isSupported(Locale locale) {
    return _jsonFiles.contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale);
    await appLocale.loadLang();
    return appLocale;
  }

  @override
  bool shouldReload(_AppLocalDelegate  old) => false;

}

String translate(BuildContext context, String key) {
  return AppLocale.of(context).getTranslated(key);
}

Languages lang(BuildContext context){
  final map = AppLocale.of(context).getLocalizationMap();
  return Languages.fromJson(map);
}

