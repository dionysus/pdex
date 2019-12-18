import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PokeList extends StatefulWidget {
  @override
  _PokeListState createState() {
    return _PokeListState();
  }
}

class _PokeListState extends State<PokeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('PokeDex List'),
          backgroundColor: Colors.red,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('pokemon').snapshots(), //name of DB Collection
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
//      crossAxisCount: 3,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          leading: Image.asset('assets/images/pokeThumbs/'+ record.id.toString() + '.png'),
          title: Text(record.name),                 // baby.name
          trailing: Text("ID: " + record.id.toString().padLeft(4, '0')),  // baby.votes
//          onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)}) //update votes
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int id;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['id'] != null),
        name = map['name'][0].toUpperCase() + map['name'].substring(1),
        id = map['id'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$id>";
}