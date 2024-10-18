class Languages{
  String? appTitle;
  String? loading;
  String? noInternet;
  String? settings;
  String? dark;
  String? light;
  String? language;
  String? noDataFound;
  String? search;
  String? pokemonDetail;
  String? abilities;
  String? moves;
  String? height;
  String? weight;
  String? attack;
  String? defense;
  String? speed;
  String? specialAttack;
  String? specialDefense;
  String? home;
  String? comparing;
  String? comparingTitle;
  String? clear;
  String? compareMessage;

  Languages.fromJson(Map<String, String> json){
    appTitle = json['app_title'];
    loading = json['loading'];
    noInternet = json['no_internet'];
    settings = json['settings'];
    dark = json['dark'];
    light = json['light'];
    language = json['language'];
    noDataFound = json['no_data_found'];
    search = json['search'];
    pokemonDetail = json['pokemon_detail'];
    abilities = json['abilities'];
    moves = json['moves'];
    height = json['height'];
    weight = json['weight'];
    attack = json['attack'];
    defense = json['defense'];
    speed = json['speed'];
    specialAttack = json['special_attack'];
    specialDefense = json['special_defense'];
    home = json['home'];
    comparing = json['comparing'];
    comparingTitle = json['comparing_title'];
    clear = json['clear'];
    compareMessage = json['compare_message'];
  }
}