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
    List<dynamic> _type;

    _Result(result){
        _id = result['id'];
        _name = result['name'];
        _gen = result['gen'];
        _type = result['type'];
    }

    get name => _name;
    get id => _id;
    get gen => _gen;
    get type => _type;

    get thumb => 'assets/images/pokeThumbs/'+ _id.toString() + '.png';
    get idString => _id.toString().padLeft(4, '0');
    get nameCap => _name[0].toUpperCase() + _name.substring(1);
}

