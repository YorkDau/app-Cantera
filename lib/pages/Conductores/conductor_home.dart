import 'package:flutter/material.dart';
import 'package:parcial/models/conductor.dart';
import 'package:parcial/pages/Conductores/conductor_create.dart';
import 'package:parcial/pages/Conductores/conductor_update.dart';
import 'package:parcial/providers/conductor_provider.dart';
import 'package:provider/provider.dart';

class ConductoresHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConductorProvider>(context);
    //provider.updateListClientes();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: provider.conductores,
                builder: (_,AsyncSnapshot<List<Conductor>> snapshot){
                  return ListView(
                      children: snapshot.data == null ? [] : snapshot.data.map((conductor){
                        return cards(conductor: conductor,provider: provider,context: context);
                      }).toList()
                  );
                },
              )
          ),
          FlatButton(
              color: Color(0xFF45BF55),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ConductorCreate())
                );
              },
              child: Text('Nuevo Conductor',style: TextStyle(color: Colors.white),)
          )
        ],
      ),
    );
  }
  Widget cards({Conductor conductor,ConductorProvider provider, BuildContext context}) {
    return Card(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)) ,
      child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://png.pngtree.com/png-clipart/20190924/original/pngtree-user-vector-avatar-png-image_4830521.jpg'),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(conductor.nombre),
                        Text('ID: ${conductor.identificacion}')
                      ],
                    ),
                    Expanded(child: SizedBox(),),
                    IconButton(icon: Icon(Icons.edit), onPressed:() {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ConductorUpdate(conductor)
                        ),
                      );
                    }
                    ),
                    IconButton(icon: Icon(Icons.delete), onPressed: (){
                      provider.delete(conductor.id);
                    })
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}