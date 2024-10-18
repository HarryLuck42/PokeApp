import 'package:poke_app/core/constraint/enum.dart';

class Env{
  static EnvData? _env;

  static EnvData? get env => _env;

  static void init(EnvType type){
    switch(type){
      case EnvType.development:
        _env = dev;
        break;
      case EnvType.production:
        _env = prod;
        break;
      default:
    }
  }

  static final EnvData dev = EnvData(
      debug: true,
      titleApp: "My App Dev",
      apiBaseUrl: 'apiBaseUrl',
      deepLink: 'deepLink',
      versionApi: 'versionApi'
  );

  static final EnvData prod = EnvData(
      debug: false,
      titleApp: "My App",
      apiBaseUrl: 'apiBaseUrl',
      deepLink: 'deepLink',
      versionApi: 'versionApi'
  );
}

class EnvData{
  final bool debug;
  final String titleApp;
  final String apiBaseUrl;
  final String deepLink;
  final String versionApi;

  EnvData({
    required this.debug,
    required this.titleApp,
    required this.apiBaseUrl,
    required this.deepLink,
    required this.versionApi
});
}