
(async () => {
    const database = require('./db');
    const Disponibilidade = require('./models/disponibilidade');
    const Endereco = require('./models/endereco');
    const Servico = require('./models/servico');
    const Usuario = require('./models/usuario');
    const Categoria = require('./models/categoria')

    class USUARIO{
        cadastrarUsuario(CPF, NOME, DESCRICAO,AVALIACAO){
            Usuario.create({
                cpf: CPF,
                nome: NOME,
                descricao: DESCRICAO,
                avaliacao: AVALIACAO,
            })
            console.log("cadastrado "+ CPF)
        }

        procurarUsuario(CPF){
            return Usuario.findByPk(CPF)
        }

        deletarUsuario(CPF){
            Usuario.destroy({
                where: {
                    cpf: CPF
                }
            })
        }
    }

    class SERVICO{
        gerarServico(ID, VALOR, DESCRICAO, CPF_GERA, CPF_ACEITA){
            Servico.create({
                id: ID,
                valor: VALOR,
                descricao: DESCRICAO,
                geracpf: CPF_GERA,
                aceitacpf: CPF_ACEITA
            })
        }

        aceitaServico(ID, VALOR, DESCRICAO, CPF_GERA, CPF_ACEITA){
            Servico.create({
                id: ID,
                valor: VALOR,
                descricao: DESCRICAO,
                geracpf: CPF_GERA,
                aceitacpf: CPF_ACEITA
            })
        }

        servicosAceitos(CPF_ACEITA){
            return Servico.findAll({
                    where: {
                        cpf: CPF_ACEITA
                    }
                });
        }

        servicosGerados(CPF_ACEITA){
            return Servico.findAll({
                    where: {
                        cpf: CPF_ACEITA
                    }
                });
        }
    }

    class DISPONIBILIDADE{
        adicionarDisponibilidade(ID ,SERVICO_ID, DATA, SEMANAL, HORARIO_INICIO, HORARIO_FIM){
            Disponibilidade.create({
                id: ID,
                servicoID: SERVICO_ID, 
                data: DATA,
                semanal: SEMANAL,
                horario_inicio: HORARIO_INICIO,
                horario_fim: HORARIO_FIM
            })
        }

        procurarDisponibilidade(SERVICO_ID){
            return Disponibilidade.findAll({
                    where: {
                        servicoID: SERVICO_ID,
                    }
                })
        }
    }

    class CATEGORIA{
        cadastrarCategoria(ID, NOME){
            Categoria.create({
                id: ID,
                nome: NOME
            })
        }

        pesquisarCategorias(){

        }
    }

    await database.sync();
    const user = new USUARIO

    const novaCategoria = await Categoria.create({id:2, nome:'Domesticos'})

    
})();