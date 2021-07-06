import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountriesInfo extends StatefulWidget {
  static const routname = '/countresinfo';
  @override
  _CountriesInfoState createState() => _CountriesInfoState();
}

class _CountriesInfoState extends State<CountriesInfo> {
  Future gettingdata() async {
    var url = 'https://corona.lmao.ninja/v2/countries?sort=cases';
    var response = await http.get(url);
    var countryinformation = jsonDecode(response.body);
    return countryinformation;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('countries information'),
      ),
      body: FutureBuilder(
          future: gettingdata(),
          builder: (ctx, snaphot) {
            return snaphot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snaphot.data.length,
                    itemBuilder: (ctx, i) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    snaphot.data[i]['country'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image(
                                      height: 40,
                                      image: NetworkImage(
                                        snaphot.data[i]['countryInfo']['flag'],
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'confirmed       :',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snaphot.data[i]['cases'].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Active       : ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snaphot.data[i]['active'].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Recovered     :',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snaphot.data[i]['recovered'].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'DEATHS       :',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snaphot.data[i]['deaths'].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
          }),
    );
  }
}
/**
 ListTile(
                        title: Text(
                          snaphot.data[i]['country'],
                        ),
                        leading: Image(
                          height: 20,
                          image: NetworkImage(
                            snaphot.data[i]['countryInfo']['flag'],
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              snaphot.data[i]['cases'].toString(),
                              style: TextStyle(fontSize: 17, color: Colors.red),
                            ),
                          ],
                        ),
                      );
 */
