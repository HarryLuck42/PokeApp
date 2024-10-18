part of 'app_bloc.dart';


class AppState  extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppInitial extends AppState {
  final ThemeData? themeData;

  final String? lang;

  @override
  List<Object?> get props => [themeData, lang];

  AppInitial({ThemeData? themeData, String? lang}): themeData = (SharedPreference().readStorage(SpKeys.isLightTheme) ?? true) ? appLightTheme() : appDarkTheme(), lang = (SharedPreference().readStorage(SpKeys.locale) ?? "en");

  AppInitial copyWith({ThemeData? themeData, String? lang}){
    return AppInitial(
      themeData: themeData ?? this.themeData,
      lang: lang ?? this.lang
    );
  }
}
