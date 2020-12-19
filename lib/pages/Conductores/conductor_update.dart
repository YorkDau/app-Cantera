import 'package:flutter/material.dart';
import 'package:parcial/models/conductor.dart';
import 'package:parcial/providers/conductor_provider.dart';
import 'package:provider/provider.dart';


class ConductorUpdate extends StatefulWidget {

  final Conductor conductor;

 ConductorUpdate(this.conductor);

  @override
  _ConductorUpdateState createState() => _ConductorUpdateState();
}

class _ConductorUpdateState extends State<ConductorUpdate> {

  var _nameController;
  var _identificacion;
  var _telefono;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text:widget.conductor.nombre);
    _identificacion = TextEditingController(text:widget.conductor.identificacion);
    _telefono       = TextEditingController(text:widget.conductor.telefono);

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
                onPressed: (){
                  Conductor conductor = new Conductor(
                      id: widget.conductor.id,
                      identificacion: _identificacion.text,
                      nombre: _nameController.text,
                      telefono: _telefono.text,
                  );
                  provider.updateConductor(conductor);
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