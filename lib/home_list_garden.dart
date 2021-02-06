import 'package:flutter/material.dart';
import 'package:hackatown/hero_vegetable_garden.dart';

class HomeGardenList extends StatefulWidget {
  @override
  _HomeGardenListState createState() => _HomeGardenListState();
}

class _HomeGardenListState extends State<HomeGardenList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: <Widget>[
            _dataList("fraise", "30/12/01", 12, 10),
            _dataList("epinard", "30/12/01", 12, 10),
            _dataList("framboise", "30/12/01", 12, 10),
            _dataList("pomme", "30/12/01", 12, 10),
          ],
        ),
      ),
    );
  }

  Widget _dataList(String type, String date, int humidity, int temp) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  type.toUpperCase(),
                  //ici print le nom de ton aliment ex: element.name
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeroGardenData(
                        type: type, //aliment.name
                        humidity: humidity, //aliment.humidity
                        temp: temp, //aliment.temp
                        date: date, //aliment.date
                      ),
                    ),
                  );
                },
                color: Colors.transparent,
                elevation: 0,
                child: Icon(
                  Icons.navigate_next,
                  size: 80,
                ),
              ),
            ],
          )),
    );
  }
}
