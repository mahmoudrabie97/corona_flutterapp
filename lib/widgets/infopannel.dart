import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/answerquwstion.dart';

class IndoPannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(QuestionAnswer.routname);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            color: Colors.greenAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('FQAS questions and answer ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                Icon(Icons.forward)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          padding: EdgeInsets.all(10),
          color: Colors.tealAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Colors.tealAccent,
                child: Text(
                  'Myth Bosters',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.forward),
                onPressed: () async {
                  String url =
                      'https://www.who.int/indonesia/news/novel-coronavirus/mythbusters';
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                      forceWebView: false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          padding: EdgeInsets.all(10),
          color: Colors.deepOrange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  'DONateD',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.forward),
                onPressed: () async {
                  String url = 'https://covid19responsefund.org/en/';
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                      forceWebView: false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
