import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/app.dart';
import 'package:poke_app/core/lifecycle/lifecycle_manager.dart';
import 'package:poke_app/core/lifecycle/route_observer.dart';
import 'package:poke_app/core/routing/routes_actions.dart';
import 'package:poke_app/initial/bloc/app_bloc.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/initial/multiproviders.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/routing/routing.dart';

class MyAppLayout extends StatefulWidget {
  const MyAppLayout({Key? key}) : super(key: key);

  @override
  State<MyAppLayout> createState() => _MyAppLayoutState();
}

class _MyAppLayoutState extends State<MyAppLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Multiproviders.inject(),
      child: BlocBuilder<AppBloc, AppInitial>(
        builder: (context, state) {
          return LifecycleManager(
            child: MaterialApp(
              key: materialAppKey,
              title: "PokeApp",
              theme: state.themeData,
              navigatorObservers: [
                CustomRouteObserver(),
                CustomRouteObserver.routeObserver
              ],
              supportedLocales: const [Locale("en"), Locale("id")],
              locale: Locale(state.lang ?? "en"),
              localizationsDelegates: const [
                AppLocale.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              onGenerateInitialRoutes: RoutesActions.initialAction,
              onGenerateRoute: RoutesActions.allActions,
              debugShowCheckedModeBanner: false,
              navigatorKey: Routing.navigatorKey,
              scaffoldMessengerKey: Routing.scaffoldMessengerKey,
              builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child ??
                      Container(
                        color: Colors.white,
                      )),
              // home: const MainScreen(),
            ),
          );
        },
      ),
    );
  }
}
