import 'package:flutter/material.dart';
import 'package:quran_app/src/chapters/model/model.dart';
import 'package:quran_app/src/chapters/model/bloc/Verses_bloc.dart';
import 'dart:developer';

class Data extends StatefulWidget {
  final String name;
  final int id;
  final int verses_count;

  Data(
      {Key key,
      @required this.name,
      @required this.id,
      @required this.verses_count})
      : super(key: key);

  @override
  _Verses_ui createState() => _Verses_ui();
}

// ignore: camel_case_types
class _Verses_ui extends State<Data> {
  final _bloc = Verses_bloc(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: StreamBuilder(
          stream: _bloc.output_verses,
          initialData: List<Madni>(),
          builder: (BuildContext contest, AsyncSnapshot<List<Madni>> snapshot) {
            return ListView(children: snapshot.data.map(_buildList).toList());
          }),
    );
  }

  Widget getMeta() {
    return StreamBuilder(
      stream: _bloc.outpur_pages,
      builder: (BuildContext context, AsyncSnapshot<Meta> snapshot) {
        return Text('${snapshot.data.total_pages}');
      },
    );
  }

  Widget _buildList(Madni e) {
    return ListTile(
      title: Text(
        e.text_madani,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
