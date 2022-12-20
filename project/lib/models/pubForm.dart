import 'dart:html';

class Pub {
  final int userId;
  final String nomeUsuario;
  final String titulo;
  final String vaga;
  final String descricao;
  final String datasHorarios;
  final String valor;
  final String modeloTrab;
  final String cidadeBairro;
  final String imagem; // TODO: como enviar a imagem pro back

  const Pub({
    required this.userId,
    required this.nomeUsuario,
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
      userId: json['userId'],
      nomeUsuario: json['nomeUsuario'],
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
