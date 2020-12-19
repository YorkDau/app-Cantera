class Conductor {

  String id;
  String identificacion;
  String nombre;
  String telefono;

  Conductor({this.id,this.identificacion,this.nombre,this.telefono,});

  Conductor.fromMap(Map<String,dynamic> map) {

    this.id = map['id'];
    this.identificacion = map['identificacion'];
    this.nombre = map['nombre'];
    this.telefono = map['telefono'];

  }

  Map<String,dynamic> toMap() {
    return {
      'id' : this.id,
      'identificacion':this.identificacion,
      'nombre':this.nombre,
      'telefono':this.telefono,
    };
  }

}