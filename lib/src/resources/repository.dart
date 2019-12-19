import 'dart:async';
import 'pokedex_provider.dart';
import '../models/ItemModel.dart';

class Repository {
    final pokeDexProvider = PokeDexProvider();

    Future<ItemModel> fetchPokemonList() => pokeDexProvider.fetchPokemonList();

}