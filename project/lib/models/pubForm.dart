import 'dart:html';

class Pub {
  final String titulo;
  final String vaga;
  final String descricao;
  final String datasHorarios;
  final String valor;
  final String modeloTrab;
  final String cidadeBairro;
  final String imagem; // TODO: como enviar a imagem pro back

  const Pub({
    required this.titulo,
    required this.vaga,
    required this.descricao,
    required this.datasHorarios,
    required this.valor,
    required this.modeloTrab,
    required this.cidadeBairro,
    required this.imagem,
  });

  factory Pub.fromJson(Map<String, dynamic> json) {
    return Pub(
      titulo: json['titulo'],
      vaga: json['vaga'],
      descricao: json['descricao'],
      datasHorarios: json['datasHorarios'],
      valor: json['valor'],
      modeloTrab: json['modeloTrab'],
      cidadeBairro: json['cidadeBairro'],
      imagem: json['imagem'],
    );
  }
}
