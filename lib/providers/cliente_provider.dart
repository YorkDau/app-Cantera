import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:parcial/global.dart';
import 'package:parcial/models/cliente.dart';


class ClienteProvider extends ChangeNotifier {

  List<Cliente> _clientes;

  Future<List<Cliente>> get clientes async{
    
    var response = await http.get('http://$SERVER_NAME:$SERVER_PORT/api/cliente');

    if(response.statusCode == 200){
      List<dynamic> resource = json.decode(response.body);

      List<Cliente> clientes = resource.map((e) {
        return Cliente.fromMap(e);
      }).toList();


      setCliente = clientes;
    }
    return this._clientes;

  }
  set setCliente(List<Cliente> clientes) {
      this._clientes = clientes;
  }

  updateCliente(Cliente cliente) async {
      var response = await http.put(
        'http://$SERVER_NAME:$SERVER_PORT/api/cliente/${cliente.id}',
         body: cliente.toMap()
      );
      notifyListeners();
  }
  
  saveCliente(Cliente cliente) async {
      cliente.id = Uuid().v4();
      var response = await http.post(
        'http://$SERVER_NAME:$SERVER_PORT/api/cliente',
         body: cliente.toMap()

      );
      notifyListeners();
  }
   
  updateListClientes() async {
   
    
    notifyListeners();
  }

  delete(String id) async {
     var response = await http.delete('http://$SERVER_NAME:$SERVER_PORT/api/cliente/$id'); 
     notifyListeners();
  }
  

}