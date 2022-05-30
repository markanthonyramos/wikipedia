import 'package:flutter/material.dart';
import 'database.dart';
import 'DynamicScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Wikipedia"),
          actions: [
            IconButton(
                onPressed: () {
                  print("Search icon");
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: WikipediaPerson(),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        ExtractDynamicScreenArguments.routeName: (context) =>
            const ExtractDynamicScreenArguments()
      },
    );
  }
}

class WikipediaPerson extends StatefulWidget {
  @override
  _WikipediaPersonState createState() => _WikipediaPersonState();
}

class _WikipediaPersonState extends State {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        return _buildColumn(i);
      },
    );
  }

  Widget _buildColumn(int i) {
    return Row(children: [
      Expanded(
          child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ExtractDynamicScreenArguments.routeName,
              arguments: DynamicScreenArguments(i));
        },
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Image.asset(
                "assets/images/${data[i]['name']}.jpg",
                height: 70,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "${data[i]['name']}",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        )),
      ))
    ]);
  }
}
