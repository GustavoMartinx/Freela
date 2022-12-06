import Notificacao from '../models/notificacao.js';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';

class DAONotificacao {
  async cadastrar(req, res) {

    var dados = req.body;
    // criptografar a senha do usuário antes de guardar no banco de dados
    //dados.senha = bcrypt.hash(dados.senha, 10)
    //cria um usuário e insere no BD
    const notificacao = await Notificacao.create(dados, (err) => {
      if (err) return res.status(400).json({
        error: true,
        code: 101,
        message: "Error: Notificação não foi cadastrada com sucesso!"
      });
    });

    return res.status(201).json({
      error: false,
      message: "Notificação cadastrado com sucesso!",
      dados: notificacao
    });
  }

//   async show(req, res) {

//     Pub.findOne({ where: { id: req.params.id } }).then((pub) => {
//       return res.status(200).json({
//         error: false,
//         pub: pub
//       });
//     }).catch((err) => {
//       return res.status(400).json({
//         error: true,
//         code: 107,
//         message: "Error: Não foi possível mostrar os detalhes da Publicação!"
//       });
//     });
//   }

  async index(req, res) {

    //const url = config.url + "/files/noticia/"; // Para puxar as imagens do BD

    Notificacao.findAll({}).then((notificacao) => {
      return res.status(200).json({
        error: false,
        notificacao
      });
    }).catch((err) => {
      return res.status(400).json({
        error: true,
        code: 101,
        message: "Erro: Não foi possível executar a solicitação!"
      });
    });
  }

  async delete(req, res) {

    // de preferencia fazer com que um usuário tenha que estar logado para isso funcionar
    // usar o userAuth do config/auth.js
    const notificacao = await Notificacao.deleteOne({ id: req.params.id }, (err) => {
      if (err) return res.status(400).json({
        error: true,
        code: 122,
        message: "Error: Notificação não foi apagado com sucesso!"
      });
    });

    return res.status(200).json({
      error: false,
      message: "Notificação apagado com sucesso!"
    });
  }
}

export default new DAONotificacao();