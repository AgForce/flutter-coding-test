import 'package:flutter/material.dart';

// TODO The main screen should display an auto updating list of orders. As the app's UI will grow more complex in the future,
// we need to have a proper separation of UI and business logic.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        // TODO return widget displaying order data
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {}, // TODO Start a 'Create Order' dialog
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
