import 'package:dio/dio.dart';
import 'package:poke_app/model/response/pokemon_ability_response.dart';
import 'package:poke_app/model/response/pokemon_detail_response.dart';
import 'package:poke_app/model/response/pokemon_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {required String baseUrl}) = _ApiService;

  @GET("pokemon/")
  Future<PokemonResponse> getPokemonList(
      @Query("offset") int offset, @Query("limit") int limit);

  @GET("pokemon/{name}")
  Future<PokemonDetailResponse> getPokemonDetail(@Path("name") String name);

  @GET("ability/{id}")
  Future<PokemonAbilityResponse> getPokemonAbility(@Path("id") String id);
}
