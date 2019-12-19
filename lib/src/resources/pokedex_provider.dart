import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ItemModel.dart';
import 'dart:async';

final db = Firestore.instance;

class PokeDexProvider {

    Future<ItemModel> fetchPokemonList() async {
        print("entered fetchPokemonList");

        QuerySnapshot querySnapshot = await db.collection("pokemon").getDocuments();
        var list = querySnapshot.documents;
        return ItemModel(list);

    }

}

