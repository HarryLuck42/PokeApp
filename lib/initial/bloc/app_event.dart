part of 'app_bloc.dart';

class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeLocale extends AppEvent {

  ChangeLocale({required this.lang});

  final String lang;

  @override
  List<Object?> get props => [lang];
}

class ChangeMode extends AppEvent {
  ChangeMode({required this.mode});

  final ThemeData mode;

  @override
  List<Object?> get props => [mode];
}
