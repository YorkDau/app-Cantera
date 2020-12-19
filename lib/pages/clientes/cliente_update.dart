import 'package:flutter/material.dart';
import 'package:parcial/models/cliente.dart';
import 'package:parcial/providers/cliente_provider.dart';
import 'package:provider/provider.dart';


class ClienteUpdate extends StatefulWidget {
  
  final Cliente cliente;

  ClienteUpdate(this.cliente);

  @override
  _ClienteUpdateState createState() => _ClienteUpdateState();
}

class _ClienteUpdateState extends State<ClienteUpdate> {

  var _nameController;
  var _identificacion;
  var _telefono;
  var _tipo;
  var _departamento;
  var _municipio;
  var _direccion;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text:widget.cliente.nombre);
    _identificacion = TextEditingController(text:widget.cliente.identificacion);
    _telefono       = TextEditingController(text:widget.cliente.telefono);
    _tipo           = TextEditingController(text:widget.cliente.tipo);
    _departamento   = TextEditingController(text:widget.cliente.ubicacion.departamento);
    _municipio      = TextEditingController(text:widget.cliente.ubicacion.municipio);
    _direccion      = TextEditingController(text:widget.cliente.ubicacion.direccion);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClienteProvider>(context,listen: false);
    return Scaffold(
       appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.black) ,
         elevation: 0,
         backgroundColor: Colors.white,
         title: Text('Nuevo Cliente',style: TextStyle(color: Colors.black),),
         centerTitle: true,
       ),
       body: ListView(
         children: [
           Container(
             margin: EdgeInsets.all(10.0),
             child: TextField(
               controller: _identificacion,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                 hintText: 'Identificación',
                 labelText: 'Identificación',
                 border: OutlineInputBorder()
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(10.0),
             child: TextField(
               controller: _nameController,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                 hintText: 'Nombre',
                 labelText: 'Nombre',
                 border: OutlineInputBorder()
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(10.0),
             child: TextField(
               controller: _telefono,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                 hintText: 'Telefono',
                 labelText: 'Telefono',
                 border: OutlineInputBorder()
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(10.0),
             child: TextField(
               controller: _tipo,
               keyboardType: TextInputType.multiline,
               decoration: InputDecoration(
                 hintText: 'tipo',
                 labelText: 'tipo',
                 border: OutlineInputBorder()
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(10.0),
             child: TextField(
               controller: _departamento,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                 hintText: 'Departamento',
                 labelText: 'Departamento',
                 border: OutlineInputBorder()
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(10.0),
             child: TextField(
               controller: _municipio,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                 hintText: 'Municipio',
                 labelText: 'Municipio',
                 border: OutlineInputBorder()
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(10.0),
             child: TextField(
               controller: _direccion,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                 hintText: 'Dirección',
                 labelText: 'Dirección',
                 border: OutlineInputBorder()
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(10.0),
             child: FlatButton(
                  color: Color(0xFF45BF55),
                  onPressed: (){
                    Cliente cliente = new Cliente(
                      id: widget.cliente.id,
                      identificacion: _identificacion.text,
                      nombre: _nameController.text,
                      telefono: _telefono.text,
                      tipo: _tipo.text,
                      ubicacion: Ubicacion(
                        departamento: _departamento.text,
                        direccion: _direccion.text,
                        municipio: _municipio.text
                      )
                    );
                    provider.updateCliente(cliente);
                    Navigator.pop(context);
                  },
                  child: Text('Actualizar',style: TextStyle(color: Colors.white),)
               ),
           )
         ],
       ),
    );
  }
}