import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldWide extends StatefulWidget {
  @override
  _WorldWideState createState() => _WorldWideState();
}

class _WorldWideState extends State<WorldWide> {
  Future getdara() async {
    var url = 'https://corona.lmao.ninja/v2/all';
    var response = await http.get(url);
    var obj = jsonDecode(response.body);
    return obj;
  }

  Widget content(String tex1, String text2, Color color) {
    return Container(
      padding: EdgeInsets.all(20),
      color: color,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            tex1,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    getdara();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdara(),
      builder: (ctx, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: 200,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  children: <Widget>[
                    content(
                        'Confirmed',
                        snapshot.hasData
                            ? snapshot.data['cases'].toString()
                            : 'updating data',
                        Colors.yellow[200]),
                    content('Active', snapshot.data['active'].toString(),
                        Colors.blue[100]),
                    content('Recovered', snapshot.data['recovered'].toString(),
                        Colors.cyan[300]),
                    content('Deaths', snapshot.data['deaths'].toString(),
                        Colors.pink[800]),
                  ],
                ),
              );
      },
    );
  }
}
