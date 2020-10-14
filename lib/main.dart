// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords(),
    );
  }
}

// #docregion RWS-var
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  // #enddocregion RWS-var

  // #docregion _buildSuggestions
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
// #enddocregion RWS-build
// #docregion RWS-var
}
// #enddocregion RWS-var

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}
// この例では、マテリアルアプリを作成します。 Materialは、モバイルとWebで標準となっているビジュアルデザイン言語です。
// Flutterは、豊富なマテリアルウィジェットのセットを提供します。ファイルのセクションにuses-material-design: trueエントリを含めることをお勧めします。
// これにより、事前定義されたアイコンのセットなど、マテリアルのより多くの機能を使用できるようになります。flutterpubspec.yaml
//
// このmain()メソッドは矢印（=>）表記を使用します。1行の関数またはメソッドには矢印表記を使用します。
// アプリは拡張されStatelessWidget、アプリ自体がウィジェットになります。Flutterでは、配置、パディング、レイアウトなど、ほとんどすべてがウィジェットです。
//
//
//
// Scaffoldマテリアルライブラリのウィジェットは、デフォルトのアプリバーと、ホーム画面のウィジェットツリーを保持するbodyプロパティを提供します。ウィジェットのサブツリーは非常に複雑になる可能性があります。
// ウィジェットの主な仕事はbuild()、他の下位レベルのウィジェットの観点からウィジェットを表示する方法を説明するメソッドを提供することです。
// この例の本体はCenter、Text子ウィジェットを含むウィジェットで構成されています。Centerウィジェットは、ウィジェットサブツリーを画面の中央に揃えます。