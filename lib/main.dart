import 'dart:math';

import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new RandomState() ;
  }

}

class RandomState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _fontStyle = const TextStyle(fontSize: 18.0);
  final _saved = new Set<prefix0.WordPair>();
  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("text"),
        backgroundColor: Colors.red,
      ),
      body: _buildSuggests(),
    );
  }


  Widget _buildSuggests(){
    return new ListView.builder(
      itemBuilder: (context,i){
        if(i.isOdd) return new Divider();
        final index = i ~/2;
        if(index>=_suggestions.length){
          _suggestions.addAll(prefix0.generateWordPairs().take(10));

        }
        return _buildRow(_suggestions[index]);
      },
      padding: const EdgeInsets.all(16)
    );
  }

  Widget _buildRow(prefix0.WordPair pair){
    final state = _saved.contains(pair);
    return new ListTile(
      title: new Text(pair.asCamelCase,
      style: _fontStyle),
      trailing: new Icon(
        state? Icons.favorite : Icons.favorite_border,
        color: state ? Colors.red : Colors.black,
      ),
      onTap: (){
        setState(() {
          if(state){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      }
    );
  }

}