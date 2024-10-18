
import 'package:dio/dio.dart';
import 'package:poke_app/model/state_response.dart';

class ApiHandling{

  static Future hitApi<T>(Future<T> service, Function(T) onSuccess, Function(Failed) onFailed, {Function? onAfter, bool checkAuth = true}) async{
    try{
      final T response = await service;
      onSuccess(response);

    }catch(e){
      if(e is DioException){
        if(e.response == null){

          onFailed(Failed(code: 406, messageError: "Error: ${e.message}"));
        }else{
          if(e.response?.statusCode == 401 && checkAuth){
            // Helper().signOut();
          }else{
            Map<String, dynamic> map = e.response?.data ?? {};
            String? message = map["message"];
            onFailed(Failed(code: e.response?.statusCode ?? 201, messageError: message ?? "Error: ${e.message}"));
          }
        }
      }else{
        onFailed(Failed(code: 406, messageError: "Error: ${e.toString()}"));
      }
    }
    finally{
      if(onAfter != null){
        onAfter();
      }
    }
  }
}