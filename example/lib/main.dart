import 'package:easy_chat_game/easy_chat_game.dart';
import 'package:example/model/chat_model_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getMainWidget(ChatData.allLevels()),
      floatingActionButton: FloatingActionButton(
        onPressed: onLaunch,
        tooltip: 'Launch',
        child: const Icon(Icons.launch),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onLaunch() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => getMainWidget([ChatData.level1()])),
    );
    if (result == false) onLaunch();
  }

  Widget getMainWidget(List<ChatLevel> levels) {
    return EasyChatGameApp(
      title: 'Teacher Chat',
      levels: levels,
    );
  }
}
