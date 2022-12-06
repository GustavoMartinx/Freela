class Notif {
  final String titulo;
  final String fonteContato;
  final String contato;

  const Notif(
      {required this.titulo,
      required this.fonteContato,
      required this.contato});

  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(
        titulo: json['titulo'],
        fonteContato: json['fonteContato'],
        contato: json['contato']);
  }
}
