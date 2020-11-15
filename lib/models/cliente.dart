class Cliente {
   
    String id;
    String identificacion;
    String nombre;
    String telefono;
    String tipo;
    Ubicacion ubicacion;

   Cliente({this.id,this.identificacion,this.nombre,this.telefono,this.ubicacion,this.tipo});

   Cliente.fromMap(Map<String,dynamic> map) {
     
        this.id = map['id'];
        this.identificacion = map['identificacion'];
        this.nombre = map['nombre'];
        this.telefono = map['telefono'];
        this.tipo = map['tipo'];
        this.ubicacion = Ubicacion.fromJson(map['ubicacion']);
    
   }

}

class Ubicacion {

  String municipio;
  String departamento;
  String direccion;

  Ubicacion({this.municipio,this.departamento,this.direccion});
  
  Ubicacion.fromJson(Map<String,dynamic> map){  
    this.departamento = map['departamento'];
    this.direccion = map['direccion'];
    this.municipio = map['municipio'];
  }

}