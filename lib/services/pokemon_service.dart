import 'package:dio/dio.dart';
// ignore: unused_import
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/mappers/pokemon_mapper.dart';

class PokemonService {
  static getPokemon<String>(String pokemonId) async{

final dio = Dio();

try{
  final responsio = await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');


final pokemon = PokemonMapper.pokeApiPokemonToEntity(responsio.data);

return (pokemon, 'Data obtenida correctamente');

}catch (e){

return (null, 'No se pudo obtener el Pokemon');

} 
}

  }


