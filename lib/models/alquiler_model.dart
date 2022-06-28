class Alquiler {
  final String id;
  final String nombre;
  final String precio;


  Alquiler({
    required this.id,
    required this.nombre,
    required this.precio,

  });

  factory Alquiler.fromJson(Map<String, dynamic> json) {
    return Alquiler(
      id: json['id'],
      nombre: json['nombre'],
      precio: json['rol'],
    );
  }
}
