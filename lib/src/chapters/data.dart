import 'package:flutter/material.dart';


class Data extends StatelessWidget {
  final String name;
  final int id;

  Data({Key key, @required this.name, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),

      ),
      body: Center(
        child: Text("In new Page"),
      ),
    );
  }
}
