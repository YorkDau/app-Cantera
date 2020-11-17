import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parcial/pages/cantera_home.dart';
import 'package:parcial/providers/cliente_provider.dart';
import 'package:parcial/providers/material_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ClienteProvider()),
          ChangeNotifierProvider(create: (_) => MaterialProvider())
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: CanteraHome()
      ),
    );
  }
}

