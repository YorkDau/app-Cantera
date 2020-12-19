import 'package:flutter/material.dart';
import 'package:parcial/models/cliente.dart';
import 'package:parcial/pages/clientes/cliente_update.dart';
import 'package:parcial/pages/clientes/clientes_create.dart';


import 'package:parcial/providers/cliente_provider.dart';
import 'package:provider/provider.dart';

class ClientesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClienteProvider>(context);
    //provider.updateListClientes();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Column(
         children: [
              Expanded(
               child: FutureBuilder(
                 future: provider.clientes,
                 builder: (_,AsyncSnapshot<List<Cliente>> snapshot){
                   return ListView(
                      children: snapshot.data == null ? [] : snapshot.data.map((cliente){
                        return cards(cliente: cliente,provider: provider,context: context);
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
                     MaterialPageRoute(builder: (_) => ClienteCreate())
                   ); 
                },
                child: Text('Nuevo Cliente',style: TextStyle(color: Colors.white),)
             )
         ],
      ),
    );
  }
  Widget cards({Cliente cliente,ClienteProvider provider, BuildContext context}) {
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
                          Text(cliente.nombre),
                          Text('ID: ${cliente.identificacion}')
                      ],
                    ),
                    Expanded(child: SizedBox(),),
                    IconButton(icon: Icon(Icons.edit), onPressed:() {
                       Navigator.of(context).push(
                         MaterialPageRoute(builder: (_) => ClienteUpdate(cliente)
                         ),
                       );
                    }
                    ),
                    IconButton(icon: Icon(Icons.delete), onPressed: (){
                        provider.delete(cliente.id);
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