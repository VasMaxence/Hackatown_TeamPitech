import 'package:flutter/material.dart';
import 'package:hackatown/hero_vegetable_garden.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart';
import 'sign_in.dart';

class HomeGardenList extends StatefulWidget {
  @override
  _HomeGardenListState createState() => _HomeGardenListState();
}

class _HomeGardenListState extends State<HomeGardenList> {

  List gardens = [1, 2, 3];

  final firestoreInstance = FirebaseFirestore.instance;
  String val = Data.Aliment[0];

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text("Add new garden"),
              content: DropdownButton<String>(
                value: val,
                elevation: 16,
                onChanged: (String newValue) {
                  setState(() {
                    val = newValue;
                  });
                },
                items:
                    Data.Aliment.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              actions: [
                FlatButton(
                    child: Text("submit"),
                    onPressed: () {
                      firestoreInstance.collection("garden").add({
                        "name": val,
                        "humidity": 72,
                        "temperature": 12,
                        "last_watered": DateTime.now()
                      }).then((value) {
                        firestoreInstance.collection("link").doc(value.id).set({
                          "uid": uid,
                        }).then((value) => print("SUCCESS!!!"));
                      });
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: gardens.length,
          itemBuilder: (BuildContext, int index) {
            return _dataList("fraise", "30/12/01", 12, 10);
          }
        )

        /*ListView(
          children: <Widget>[
            _dataList("fraise", "30/12/01", 12, 10),
            _dataList("epinard", "30/12/01", 12, 10),
            _dataList("framboise", "30/12/01", 12, 10),
            _dataList("pomme", "30/12/01", 12, 10),
          ],
        ),*/
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          _showDialog();
          },
        ),
      );
  }

  int i = 1;

  Widget _dataList(String type, String date, int humidity, int temp) {
    i == 1 ? i = 0 : i = 1;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: i == 1 ? Color(0xFF27AE60) : Color(0xFFF5B041),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: i == 1
                    ? Color(0xFF27AE60).withOpacity(0.4)
                    : Color(0xFFF5B041).withOpacity(0.4),
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
