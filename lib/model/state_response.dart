class Success{
  int code;
  dynamic response;
  Success({required this.code, required this.response});
}

class Failed{
  int code;
  String messageError;
  Failed({required this.code, required this.messageError});
}