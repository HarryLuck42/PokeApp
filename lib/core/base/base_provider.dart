import 'package:poke_app/core/helper/helper.dart';
import 'package:poke_app/core/memory/memory_action.dart';

import '../../service/api_repository.dart';
import '../memory/shared/share_preference.dart';
import '../routing/routing.dart';

class BaseProvider {

  final sharedPre = SharedPreference();

  final routing = Routing();

  final apiRep = ApiRepository();

  final helper = Helper();

  final memoryAction = MemoryAction(HiveMemoryAction());
}