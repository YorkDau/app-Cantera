class Materiales {
  String id;
  String nombre;

  Materiales({this.id, this.nombre});

  Materiales.fromMap (Map<String, dynamic> map) {
    this.id = map['id'];
    this.nombre = map['nombre'];
  }

  Map<String, dynamic> toMap() {
    return {'id': this.id, 'nombre': this.nombre};
  }
}
