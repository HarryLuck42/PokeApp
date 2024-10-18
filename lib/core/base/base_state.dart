import 'package:flutter/widgets.dart';

import '../helper/helper.dart';

mixin BaseState<T extends StatefulWidget> on State<T> {
  final helper = Helper();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        afterFirstLayout(context);
      }
    });
  }

  void afterFirstLayout(BuildContext context);
}