import 'package:flutter/material.dart';
import 'package:parcial/models/cliente.dart';
import 'package:parcial/providers/cliente_provider.dart';
import 'package:provider/provider.dart';


class ClienteCreate extends StatefulWidget {
  @override
  _ClienteCreateState createState() => _ClienteCreateState();
}

class _ClienteCreateState extends State<ClienteCreate> {

  final _nameController = TextEditingController(text:'kjfjdajsf');
  final _identificacion = TextEditingController(text:'1431421423');
  final _telefono       = TextEditingController(text:'3017764758');
  final _tipo           = TextEditingController(text:'NATURAL');
  final _departamento   = TextEditingController(text:'kjfjdajsf');
  final _municipio      = TextEditingController(text:'kjfjdajsf');
  final _direccion      = TextEditingController(text:'kjfjdajsf');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClienteProvider>(context,listen: false);
    return Scaffold(
       appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.black) ,
         elevation: 0,
         backgroundColor: Colors.white,
         title: Text('new customer',style: TextStyle(color: Colors.black),),
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
                  color: Color.fromRGBO(165, 24, 181, 1),
                  onPressed: (){
                    Cliente cliente = new Cliente(
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
                    provider.saveCliente(cliente);
                    Navigator.pop(context);
                  },
                  child: Text('save',style: TextStyle(color: Colors.white),)
               ),
           )
         ],
       ),
    );
  }
}