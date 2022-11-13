class Usuario {
  final int id;
  final String cpf;
  final String nome;
  final String profissao;
  final String imagem;
  final String descricao;

  const Usuario(
      {required this.id,
      required this.cpf,
      required this.nome,
      required this.profissao,
      required this.imagem,
      required this.descricao});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        cpf: json['cpf'],
        nome: json['nome'],
        profissao: json['profissao'],
        imagem: json['imagem'],
        descricao: json['descricao']);
  }
}
