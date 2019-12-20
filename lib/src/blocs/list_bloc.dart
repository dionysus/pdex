import 'dart:async';

import 'package:pdex/src/models/ItemModel.dart';
import 'package:pdex/src/resources/repository.dart';

import 'bloc.dart';

class ListBloc implements Bloc {
    final Repository _repository = Repository();
    final _controller = StreamController<ItemModel>();
    Stream<ItemModel> get listStream => _controller.stream;

    void fetchAllPokemon() async {
        final results = await _repository.fetchPokemonList();
        _controller.sink.add(results);
    }

    @override
    dispose() {
        _controller.close();
    }
}