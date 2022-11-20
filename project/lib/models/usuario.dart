class Usuario {
  final String cpf;
  final String email;
  final String senha;
  final String nome;
  final String profissao;
  final String fonteContato;
  final String contato;
  final String imagem;
  final String descricao;

  const Usuario(
      {required this.cpf,
      required this.email,
      required this.senha,
      required this.nome,
      required this.profissao,
      required this.fonteContato,
      required this.contato,
      required this.imagem,
      required this.descricao});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        cpf: json['cpf'],
        email: json['email'],
        senha: json['senha'],
        nome: json['nome'],
        profissao: json['profissao'],
        fonteContato: json['fonteContato'],
        contato: json['contato'],
        imagem: json['imagem'],
        descricao: json['descricao']);
  }
}
