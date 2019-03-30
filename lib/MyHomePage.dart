import 'package:flutter/material.dart';
import 'model/Chapters.dart';
import 'model/bloc/HomePageBloc.dart';
import 'package:quran_app/src/chapters/Verses_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utils/searchbar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = HomePagebloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.output,
      initialData: List<Chapters>(),
      builder: (BuildContext context, AsyncSnapshot<List<Chapters>> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            leading: Icon(FontAwesomeIcons.mosque),
            actions: <Widget>[
              IconButton(
                  icon: Icon(FontAwesomeIcons.search),
                  onPressed: () {
                    showSearch(
                        context: context, delegate: SearchBar(snapshot.data));
                  })
            ],
          ),
          body: ListView(
            children: snapshot.data.map(_buildItem).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            mini: false,
            child: Icon(FontAwesomeIcons.quran),
            tooltip: "Resume",
          ),
        );
      },
    );
//    Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//        leading: Icon(FontAwesomeIcons.mosque),
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(FontAwesomeIcons.search),
//              onPressed: () {
//                showSearch(context: context, delegate: SearchBar());
//              })
//        ],
//      ),
//      body: StreamBuilder(
//          stream: _bloc.output,
//          initialData: List<Chapters>(),
//          builder:
//              (BuildContext context, AsyncSnapshot<List<Chapters>> snapshot) {
//            if (snapshot.connectionState == ConnectionState.waiting) {
//              return Center(
//                child: CircularProgressIndicator(
//                  backgroundColor: Colors.limeAccent,
//                ),
//              );
//            } else {
//              return ListView(
//                children: snapshot.data.map(_buildItem).toList(),
//              );
//            }
//          }),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {},
//        mini: false,
//        child: Icon(FontAwesomeIcons.quran),
//        tooltip: "Resume",
//        backgroundColor: Colors.limeAccent,
//      ),
//    );
//    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buildItem(Chapters chap) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.white.withOpacity(0.5)))),
          child: ListTile(
            title: Text('${chap.name_simple}'),
            subtitle: Text('${chap.revelation_place}'),
            trailing: Text(
              '${chap.name_arabic}',
            ),
            leading: Text('${chap.chapter_number}'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Data(
                            name: chap.name_simple,
                            id: chap.id,
                            verses_count: chap.verses_count,
                          )));
            },
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
