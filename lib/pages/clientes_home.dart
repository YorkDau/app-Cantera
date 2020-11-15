import 'package:flutter/material.dart';
import 'package:parcial/providers/cliente_provider.dart';
import 'package:provider/provider.dart';

class ClientesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClienteProvider>(context);
    provider.updateListClientes();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Column(
         children: [
              Expanded(
               child: ListView(
                 children: provider.clientes == null ? [] : provider.clientes.map((e){
                   return cards(id:e.id,identificacion: e.identificacion,nombre: e.nombre,provider: provider);
                 }).toList()
               ),
               
             ),
              ElevatedButton(
                  style: ButtonStyle(
                    
                  ),
                  child: Text('new customer'),
                  onPressed: null,
              ),
         ],
      ),
    );
  }

  Widget cards({String id, String nombre, String identificacion,ClienteProvider provider}) {
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
                          Text(nombre),
                          Text('ID: $identificacion')
                      ],
                    ),
                    Expanded(child: SizedBox(),),
                    IconButton(icon: Icon(Icons.edit), onPressed:() {
                    
                    }),
                    IconButton(icon: Icon(Icons.delete), onPressed: (){
                        provider.delete(id);
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