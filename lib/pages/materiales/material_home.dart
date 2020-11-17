import 'package:flutter/material.dart';
import 'package:parcial/models/material.dart';
import 'package:parcial/pages/materiales/material_create.dart';
import 'package:parcial/pages/materiales/material_update.dart';
import 'package:parcial/providers/material_provider.dart';
import 'package:provider/provider.dart';

class MaterialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MaterialProvider>(context);
    //provider.updateListClientes();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: provider.materiales,
            builder: (_, AsyncSnapshot<List<Materiales>> snapshot) {
              return ListView(
                  children: snapshot.data == null
                      ? []
                      : snapshot.data.map((material) {
                          return cards(
                              material: material,
                              provider: provider,
                              context: context);
                        }).toList());
            },
          )),
          FlatButton(
              color: Color.fromRGBO(165, 24, 181, 1),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MaterialCreate()));
              },
              child: Text(
                'Nuevo Material',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Widget cards(
      {Materiales material, MaterialProvider provider, BuildContext context}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(material.nombre),
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => MaterialUpdate(material),
                        ),
                      );
                    }),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      provider.delete(material.id);
                    })
              ],
            )
          ],
        ),
      )),
    );
  }
}
