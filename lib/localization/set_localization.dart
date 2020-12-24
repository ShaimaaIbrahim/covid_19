import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SetLocalization {

  Locale locale;

  SetLocalization({this.locale});

  static SetLocalization of(BuildContext context) {
    return Localizations.of<SetLocalization>(context, SetLocalization);
  }

  static  LocalizationsDelegate<SetLocalization> delegete =
  AppLocalizationDelegete();


  Map<String, String> _localizationString;

  Future<bool> load() async {
    String jsonString =
    await rootBundle.loadString('langs/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizationString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(String key) {
    return _localizationString[key];
  }

  String getCurrentCode(){
   return locale.languageCode;
  }

}


class AppLocalizationDelegete extends LocalizationsDelegate<SetLocalization>{

  @override
  bool isSupported(Locale locale) {
    return ['en' , 'ar'].contains(locale.languageCode);
  }

  @override
  Future<SetLocalization> load(Locale locale) async {
    SetLocalization localization = new SetLocalization(locale: locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<SetLocalization> old) {
    return false;
  }

}