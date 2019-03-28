import 'package:flutter/material.dart';
import 'package:quran_app/src/chapters/model/model.dart';
import 'package:quran_app/src/chapters/model/bloc/Verses_bloc.dart';

class Data extends StatefulWidget {
  final String name;
  final int id;

  Data({Key key, @required this.name, @required this.id}) : super(key: key);

  @override
  _Verses_ui createState() => _Verses_ui();
}

// ignore: camel_case_types
class _Verses_ui extends State<Data> {
  final _bloc = Verses_bloc(2);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: StreamBuilder(
          stream: _bloc.output,
          initialData: List<Madni>(),
          builder: (BuildContext contest, AsyncSnapshot<List<Madni>> snapshot) {
            return ListView(children: snapshot.data.map(_buildList).toList());
          }),
    );
  }

  Widget _buildList(Madni e) {
    return ListTile(
      title: Text(e.text_madani,textAlign: TextAlign.right,),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
  }
}
