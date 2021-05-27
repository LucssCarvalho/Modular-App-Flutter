import 'package:dio/dio.dart';
import 'package:modular_app/app/shared/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;
  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPkemon() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = [];

    for (var json in (response.data['results'] as List)) {
      PokemonModel model = PokemonModel(name: json['name']);
      list.add(model);
    }

    return list;
  }
}
