import 'package:corona1/dataset.dart';
import 'package:corona1/screens/allcountryies.dart';
import 'package:corona1/widgets/worldwide.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../widgets/mostaffectpannel.dart';
import '../widgets/infopannel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'COVID-19 pannel',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                height: 70,
                child: Card(
                  color: Colors.amber,
                  child: Marquee(
                    text: description,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    blankSpace: 40,
                    accelerationDuration: Duration(seconds: 2),
                  ),
                )),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'World Wide',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(CountriesInfo.routname);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue[900],
                      ),
                      child: Text(
                        'Regional',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            WorldWide(),
            SizedBox(
              height: 3,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.blueAccent,
              child: Text(
                'Most effected countries',
                style: TextStyle(fontSize: 17, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            MostAffectPannel(),
            SizedBox(
              height: 2,
            ),
            IndoPannel(),
          ],
        ),
      ),
    );
  }
}
