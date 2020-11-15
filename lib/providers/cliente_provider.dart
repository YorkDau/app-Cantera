import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:parcial/models/cliente.dart';


class ClienteProvider extends ChangeNotifier {

  List<Cliente> _clientes;

  List<Cliente> get clientes => this._clientes;

  set setCliente(List<Cliente> clientes) {
      this._clientes = clientes;
  }
   
  updateListClientes() async {
  
    var response = await http.get('http://192.168.1.14:8001/api/cliente');

    if(response.statusCode == 200){
      List<dynamic> resource = json.decode(response.body);
      List<Cliente> clientes = resource.map((e) {
        return Cliente.fromMap(e);
      }).toList();
      setCliente = clientes;
    }
    notifyListeners();
  }

  delete(String id) async {
     var response = await http.delete('http://192.168.1.14:8001/api/cliente/$id'); 
     notifyListeners();
  }
  

}