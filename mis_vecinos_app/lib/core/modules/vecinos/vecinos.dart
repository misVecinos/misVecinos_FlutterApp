class NegocioVecino {
  final int id;
  final String nombre;
  final String email;
  final String imagenNegocio;
  final String imagenEncargado;
  final String encargadoPrincipal;
  final int totalTrabajadores;
  final double horaEntrada;
  final double horaSalida;
  final String direccion;
  final int telefono;

  NegocioVecino(
      {required this.imagenNegocio,
      required this.imagenEncargado,
      required this.id,
      required this.nombre,
      required this.email,
      required this.encargadoPrincipal,
      required this.totalTrabajadores,
      required this.horaEntrada,
      required this.horaSalida,
      required this.direccion,
      required this.telefono});
}
