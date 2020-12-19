import 'package:flutter/material.dart';
import 'package:parcial/models/cliente.dart';
import 'package:parcial/models/material.dart';
import 'package:parcial/providers/cliente_provider.dart';
import 'package:parcial/providers/material_provider.dart';
import 'package:provider/provider.dart';


class MaterialCreate extends StatefulWidget {
  @override
  _MaterialCreateState createState() => _MaterialCreateState();
}

class _MaterialCreateState extends State<MaterialCreate> {

  final _nombre  = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MaterialProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black) ,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Nuevo Material',style: TextStyle(color: Colors.black),),
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
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: FlatButton(
                color: Color(0xFF45BF55),
                onPressed: (){
                  Materiales material = new Materiales(nombre: _nombre.text,);
                  provider.saveMaterial(material);
                  Navigator.pop(context);
                },
                child: Text('Guardar',style: TextStyle(color: Colors.white),
                ),
            ),
          ),
        ],
      ),

    );
  }
}