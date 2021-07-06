import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MostAffectPannel extends StatelessWidget {
  Future countresdata() async {
    var url = 'https://corona.lmao.ninja/v2/countries?sort=cases';
    var response = await http.get(url);
    var obj2 = jsonDecode(response.body);
    return obj2;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countresdata(),
      builder: (ctx, snapshot) {
        return Container(
          height: 120,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (ctx, i) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Image.network(
                              snapshot.data[i]['countryInfo']['flag'],
                              height: 20,
                            ),
                          ),
                          Text(
                            snapshot.data[i]['country'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data[i]['cases'].toString(),
                            style: TextStyle(fontSize: 17, color: Colors.red),
                          ),
                        ],
                      );
              }),
        );
      },
    );
  }
}
