import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart';

class GardenData {
  String id;
  Map<String, dynamic> data;

  GardenData(final id, final data) {
    this.id = id;
    this.data = data;
  }
}

class Database {
  static final firestoreInstance = FirebaseFirestore.instance;
  static List<GardenData> gardens = <GardenData>[];

  static loadGarden() async {
    final love = await firestoreInstance.collection("garden").where("uid", isEqualTo: uid).get();

    gardens.clear();
    for (final doc in love.docs)
      gardens.add(new GardenData(doc.id, doc.data()));
  }

  static uploadGardenTime(String id) async {
    await firestoreInstance.collection("garden").doc(id).update({"last_watered": DateTime.now()});
  }

  static addGarden(Map<String, dynamic> data) async {
    final ref = await firestoreInstance.collection("garden").add(data);

    gardens.add(new GardenData(ref.id, data));
  }
}