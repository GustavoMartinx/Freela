class Pub {
  final int id;
  final String vaga;
  final String descricao;
  final String horarios;
  final String valor;
  final String modelo_trabalho;
  final String cidade_bairro;
  final String imagem; // TODO: como enviar a imagem pro back

  const Pub({
    required this.id,
    required this.vaga,
    required this.descricao,
    required this.horarios,
    required this.valor,
    required this.modelo_trabalho,
    required this.cidade_bairro,
    required this.imagem,
  });

  factory Pub.fromJson(Map<String, dynamic> json) {
    return Pub(
      id: json['id'],
      vaga: json['vaga'],
      descricao: json['descricao'],
      horarios: json['horarios'],
      valor: json['valor'],
      modelo_trabalho: json['modelo_trabalho'],
      cidade_bairro: json['cidade_bairro'],
      imagem: json['imagem'],
    );
  }
}
