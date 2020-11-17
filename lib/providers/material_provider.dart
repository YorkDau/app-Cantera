import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:parcial/models/material.dart';
import 'package:uuid/uuid.dart';
import 'package:parcial/global.dart';

class MaterialProvider extends ChangeNotifier {
  List<Materiales> _material;

  Future<List<Materiales>> get materiales async {
    var response =
        await http.get('http://$SERVER_NAME:$SERVER_PORT/api/material');

    if (response.statusCode == 200) {
      List<dynamic> resource = json.decode(response.body);
      List<Materiales> materiales = resource.map((e) {
        return Materiales.fromMap(e);
      }).toList();
      setMaterial = materiales;
    }
    return this._material;
  }

  set setMaterial(List<Materiales> materiales) {
    this._material = materiales;
  }

  updateMaterial(Materiales material) async {
    var response = await http.put(
        'http://$SERVER_NAME:$SERVER_PORT/api/material/${material.id}',
        body: material.toMap());

    notifyListeners();
  }

  saveMaterial(Materiales material) async {
    material.id = Uuid().v4();
    var response = await http.post(
        'http://$SERVER_NAME:$SERVER_PORT/api/material',
        body: material.toMap());
    notifyListeners();
  }

  updateListMaterial() async {
    notifyListeners();
  }

  delete(String id) async {
    var response =
        await http.delete('http://$SERVER_NAME:$SERVER_PORT/api/material/$id');
    notifyListeners();
  }
}
