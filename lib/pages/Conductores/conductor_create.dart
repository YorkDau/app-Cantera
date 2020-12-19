import 'package:flutter/material.dart';
import 'package:parcial/models/conductor.dart';
import 'package:parcial/providers/conductor_provider.dart';
import 'package:provider/provider.dart';


class ConductorCreate extends StatefulWidget {
  @override
  _ConductorCreateState createState() => _ConductorCreateState();
}

class _ConductorCreateState extends State<ConductorCreate> {

  final _nameController = TextEditingController(text:'Andres');
  final _identificacion = TextEditingController(text:'1051674784');
  final _telefono       = TextEditingController(text:'3014101887');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConductorProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black) ,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Nuevo Conductor',style: TextStyle(color: Colors.black),),
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
            child: FlatButton(
                color: Color.fromRGBO(165, 24, 181, 1),
                onPressed: _showAlertDialog,
                child: Text('Guardar',style: TextStyle(color: Colors.white),)
            ),
          )
        ],
      ),
    );
  }
  void _showAlertDialog() {
    final provider = Provider.of<ConductorProvider>(context,listen: false);
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("Registro de Conductores"),
            content: Text("contenido del alert"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar", style: TextStyle(color: Colors.white),),
                onPressed: (){ Navigator.of(context).pop(); },
              ),
              FlatButton(
                color: Color.fromRGBO(165, 24, 181, 1),
                onPressed: (){
                  Conductor conductor = new Conductor(
                      identificacion: _identificacion.text,
                      nombre: _nameController.text,
                      telefono: _telefono.text,
                  );
                  provider.saveConductor(conductor);
                  Navigator.pop(context);
                },
                child: Text("Aceptar", style: TextStyle(color: Colors.white),),

              )
            ],
          );
        }
    );
  }
}