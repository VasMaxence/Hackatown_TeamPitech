import 'package:flutter/material.dart';

class HeroGardenData extends StatefulWidget {
  final String type;
  final int humidity;
  final int temp;
  final String date;

  HeroGardenData(
      {@required this.type,
      @required this.humidity,
      @required this.temp,
      @required this.date});

  @override
  _HeroGardenDataState createState() => _HeroGardenDataState(
      type: this.type,
      temp: this.temp,
      humidity: this.humidity,
      date: this.date);
}

class _HeroGardenDataState extends State<HeroGardenData> {
  final String type;
  final int humidity;
  final int temp;
  final String date;

  _HeroGardenDataState(
      {@required this.type,
      @required this.humidity,
      @required this.temp,
      @required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2ECC71),
        elevation: 0,
      ),
      body: Container(
        color: Colors.red,
        child: Hero(
          tag: this.type + this.date,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 12 * 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF2ECC71),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Image.asset(
                          "assets/" + this.type + ".png",
                          width: MediaQuery.of(context).size.width / 1.7,
                          height: MediaQuery.of(context).size.height / 5,
                        ),
                        top: 20,
                        left: -10,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 5,
                        left: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          this.type.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black87,
                            decoration: TextDecoration.none,
                            fontSize: MediaQuery.of(context).size.width / 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF2ECC71),
                    borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(240.0),
                      bottomLeft: const Radius.circular(240.0),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 12 * 6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          child: Text(
                            "Température: " + this.temp.toString(),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          child: Text(
                            "Humidité: " + this.humidity.toString(),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          child: Text(
                            "Dernier Arrosage: " + this.date,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
