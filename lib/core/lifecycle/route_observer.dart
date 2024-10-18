import 'package:flutter/cupertino.dart';
import 'package:poke_app/core/extention/extention.dart';

import '../routing/routing.dart';

class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>>{
  final _routing = Routing();

  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  /// Called when the current route has been pushed.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    'didPush ${route.settings.name} '.logger();
    super.didPush(route, previousRoute);
    _routing.removeSnackBar();
  }

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    'didReplace ${newRoute?.settings.name} '.logger();
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // do your magic here
  }

  /// Called when the current route has been popped off.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    'didPop ${route.settings.name} '.logger();
    super.didPop(route, previousRoute);
    // do your magic here
  }
}