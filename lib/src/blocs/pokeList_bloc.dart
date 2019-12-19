import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import'../models/ItemModel.dart';

class PokeListBloc {
    final _repository = Repository();
    final _pokemonFetcher = PublishSubject<ItemModel>();

    Observable<ItemModel> get allPokemon => _pokemonFetcher.stream;

    fetchAllPokemon() async {
        ItemModel listModel = await _repository.fetchPokemonList();
        _pokemonFetcher.sink.add(listModel);
    }

    dispose() {
        _pokemonFetcher.close();
    }
}

final bloc = PokeListBloc();