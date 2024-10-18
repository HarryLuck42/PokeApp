import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/core/base/base_provider.dart';

import '../../core/constraint/sp_keys.dart';
import '../../core/memory/shared/share_preference.dart';
import '../../core/themes/app_theme.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppInitial> with BaseProvider {
  AppBloc() : super(AppInitial()) {
    on<ChangeLocale>((event, emit) {
      sharedPre.writeStorage(SpKeys.locale, event.lang);
      emit(state.copyWith(lang: event.lang));
    });
    on<ChangeMode>((event, emit) {
      sharedPre.writeStorage(SpKeys.isLightTheme, appLightTheme() == event.mode);
      emit(state.copyWith(themeData: event.mode));
    });
  }
}
