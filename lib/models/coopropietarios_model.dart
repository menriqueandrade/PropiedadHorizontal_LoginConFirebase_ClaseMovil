class Coopropietarios {
  final String id;
  final String nombre;
  final String pago;
  final String cedula;
  final String numerovivienda;
  final String cuotaspendientes;


  Coopropietarios({
    required this.id,
    required this.nombre,
    required this.pago,
    required this.cedula,
    required this.numerovivienda,
    required this.cuotaspendientes,

  });

  factory Coopropietarios.fromJson(Map<String, dynamic> json) {
    return Coopropietarios(
      id: json['id'],
      nombre: json['nombre'],
      pago: json['pago'],
      cedula: json['cedula'],
      numerovivienda: json['numerovivienda'],
      cuotaspendientes: json['cuotaspendientes'],
    );
  }
}
