import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CanteraHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cantera', style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color: Colors.black),),
                Icon(Icons.notifications,color: Colors.black,)
              ],
            ),
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(165, 24, 181, 0.6),
                  Color.fromRGBO(165, 24, 181, 0.8),
                  Color.fromRGBO(165, 24, 181, 1)
                ]
              )
            ),
            tabs: [
               Tab(text:'Clientes'),
               Tab(text:'Conductores'),
               Tab(text:'Materiales'),
            ],
          ),
        ),
        body: TabBarView(
            children: [
              Container(
                color: Colors.red,
                child: Text(''),
              ),
               Container(
                child: Text(''),
              ),
               Container(
                child: Text(''),
              ),
            ],
          ),
      ),
    );
  }

}