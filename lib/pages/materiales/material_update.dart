import 'package:flutter/material.dart';
import 'package:parcial/models/cliente.dart';
import 'package:parcial/models/material.dart';
import 'package:parcial/providers/cliente_provider.dart';
import 'package:parcial/providers/material_provider.dart';
import 'package:provider/provider.dart';

class MaterialUpdate extends StatefulWidget {
  final Materiales materiale;

  MaterialUpdate(this.materiale);

  @override
  _MaterialUpdateState createState() => _MaterialUpdateState();
}

class _MaterialUpdateState extends State<MaterialUpdate> {
  var _nombre;

  @override
  void initState() {
    super.initState();
    _nombre = TextEditingController(text: widget.materiale.nombre);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MaterialProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'nuevo Material',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              controller: _nombre,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Nombre',
                  labelText: 'Nombre',
                  border: OutlineInputBorder()),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: FlatButton(
                color: Color(0xFF45BF55),
                onPressed: () {
                  Materiales materiale = new Materiales(
                      id: widget.materiale.id,
                      nombre: _nombre.text,
                    );
                  provider.updateMaterial(materiale);
                  Navigator.pop(context);
                },
                child: Text(
                  'Actualizar',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
