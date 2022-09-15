(async () => {

    const database = require('./db');
    const Usuario = require('./models/usuario');
    const Servico = require('./models/servico')

    await database.sync({force: true});

    const novoUsuario = await Usuario.create({
        cpf: '46446446446',
        nome: 'Cleber',
        descricao: 'O cara é top',
        avaliacao: 5
    })

    const novoServico = await Servico.create({
        id:1,
        valor: 20.20,
        descricao: 'varrer pneu',
        cpf: novoUsuario.cpf
    })

    

    // console.log(novoUsuario)
    console.log(novoServico)
})();