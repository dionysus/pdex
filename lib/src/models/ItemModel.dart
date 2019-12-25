class ItemModel {
    List<_Result> _results = [];

    ItemModel (pokeList){
        for (int i = 0; i < pokeList.length; i++){
            _Result result = _Result(pokeList[i]);
            _results.add(result);
        }
    }

    get results => _results;

}

class _Result {
    //Format {gen: 1, name: ditto, id: 132, type: [normal]}}
    String _name;
    int _id;
    int _gen;
    Map _stats;
    // int _attack;
    // int _defense;
    // int _speed;
    List<dynamic> _type;

    _Result(result){
        _id = result['id'];
        _name = result['name'];
        _gen = result['gen'];
        _type = result['type'];
        _stats = result['stats'];
    }

    get name => _name;
    get id => _id;
    get gen => _gen;
    get type => _type;
    get hp => _stats['hp'];
    get attack => _stats['attack'];
    get defense => _stats['defense'];
    get speed => _stats['speed'];

    get thumb => 'assets/images/pokeThumbs/'+ _id.toString() + '.png';
    get sprite => 'assets/images/sprites/'+ _id.toString().padLeft(3, '0') + '.png';
    get idString => _id.toString().padLeft(4, '0');
    get nameCap => _name[0].toUpperCase() + _name.substring(1);
}

