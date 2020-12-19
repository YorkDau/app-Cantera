import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parcial/models/conductor.dart';
import 'package:uuid/uuid.dart';

import 'package:parcial/global.dart';


class ConductorProvider extends ChangeNotifier {

  List<Conductor> _conductor;

  Future<List<Conductor>> get conductores async{

    var response = await http.get('http://$SERVER_NAME:$SERVER_PORT/api/conductor');

    if(response.statusCode == 200){
      List<dynamic> resource = json.decode(response.body);

      List<Conductor> conductores = resource.map((e) {
        return Conductor.fromMap(e);
      }).toList();


      setConductor = conductores;
    }
    return this._conductor;

  }
  set setConductor(List<Conductor> conductores) {
    this._conductor = conductores;
  }

  updateConductor(Conductor conductor) async {
    var response = await http.put(
        'http://$SERVER_NAME:$SERVER_PORT/api/conductor/${conductor.id}',
        body: conductor.toMap()
    );
    notifyListeners();
  }

  saveConductor(Conductor conductor) async {
    conductor.id = Uuid().v4();
    var response = await http.post(
        'http://$SERVER_NAME:$SERVER_PORT/api/conductor',
        body: conductor.toMap()

    );
    notifyListeners();
  }

  updateListConductor() async {


    notifyListeners();
  }

  delete(String id) async {
    var response = await http.delete('http://$SERVER_NAME:$SERVER_PORT/api/conductor/$id');
    notifyListeners();
  }


}