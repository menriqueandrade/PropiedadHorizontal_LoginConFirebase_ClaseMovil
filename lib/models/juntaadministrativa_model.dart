class JuntaAdministrativa {
  final String id;
  final String nombre;
  final String rol;
  final String foto;
  final String cedula;


  JuntaAdministrativa({
    required this.id,
    required this.nombre,
    required this.rol,
    required this.cedula,
    required this.foto,
    

  });

  factory JuntaAdministrativa.fromJson(Map<String, dynamic> json) {
    return JuntaAdministrativa(
      id: json['id'],
      nombre: json['nombre'],
      rol: json['rol'],
      cedula: json['cedulajuntaadmin'],

      foto: json['foto'],
    );
  }
}
