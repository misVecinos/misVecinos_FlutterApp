class Sponsor {
  final int id;
  final String titulo;
  final String contenido;
  final String imagen;
  final String? web;

  Sponsor({
    required this.id,
    required this.titulo,
    required this.contenido,
    required this.imagen,
    this.web,
  });
}
