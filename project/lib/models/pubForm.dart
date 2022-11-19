import 'dart:html';

class Pub {
  final int id;
  final String titulo;
  final String vaga;
  final String desc;
  final String datasHorarios;
  final String valor;
  final String modeloTrab;
  final String cidadeBairro;
  final String imagem; // TODO: como enviar a imagem pro back

  const Pub({
    required this.id,
    required this.titulo,
    required this.vaga,
    required this.desc,
    required this.datasHorarios,
    required this.valor,
    required this.modeloTrab,
    required this.cidadeBairro,
    required this.imagem,
  });

  factory Pub.fromJson(Map<String, dynamic> json) {
    return Pub(
      id: json['id'],
      titulo: json['titulo'],
      vaga: json['vaga'],
      desc: json['desc'],
      datasHorarios: json['datasHorarios'],
      valor: json['valor'],
      modeloTrab: json['modeloTrab'],
      cidadeBairro: json['cidadeBairro'],
      imagem: json['imagem'],
    );
  }
}
