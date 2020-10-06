import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/app_state.dart';
import 'package:flutter_provider_sample/text_display.dart';
import 'package:flutter_provider_sample/text_edit.dart';
import 'package:provider/provider.dart';

import 'response_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<AppState>(
          child: MyHomePage(), builder: (_) => AppState()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextDisplay(),
                TextEditWidget(),
                RaisedButton(
                  onPressed: () => appState.fetchData(),
                  child: Text('Fetch Data from Network'),
                ),
                ResponseDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
