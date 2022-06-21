class JuntaAdministrativa {
  final String id;
  final String nombre;
  final String rol;


  JuntaAdministrativa({
    required this.id,
    required this.nombre,
    required this.rol,

  });

  factory JuntaAdministrativa.fromJson(Map<String, dynamic> json) {
    return JuntaAdministrativa(
      id: json['id'],
      nombre: json['nombre'],
      rol: json['rol'],
    );
  }
}
