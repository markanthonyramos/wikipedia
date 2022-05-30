import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'database.dart';

class DynamicScreenArguments {
  final int id;

  DynamicScreenArguments(this.id);
}

class ExtractDynamicScreenArguments extends StatelessWidget {
  const ExtractDynamicScreenArguments({Key? key}) : super(key: key);

  static const routeName = '/extractDynamicScreenArguments';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DynamicScreenArguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("${data[args.id]['name']}"),
        ),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          "${data[args.id]['name']}",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        )),
                    Image.asset(
                      "assets/images/${data[args.id]['name']}.jpg",
                      width: 200,
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text("${data[args.id]['definition']}"))
              ],
            )));
  }
}
