import {Pub} from '../models/index.js';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';

class DAOPub {
  async cadastrar(req, res) {

    var dados = req.body;
    // criptografar a senha do usuário antes de guardar no banco de dados
    //dados.senha = bcrypt.hash(dados.senha, 10)
    //cria um usuário e insere no BD
    const pub = await Pub.create(dados, (err) => {
      if (err) return res.status(400).json({
        error: true,
        code: 101,
        message: "Error: Publicação não foi cadastrada com sucesso!"
      });
    });

    return res.status(201).json({
      error: false,
      message: "Publicação cadastrado com sucesso!",
      dados: pub
    });
  }

  async show(req, res) {

    Pub.findOne({ where: { id: req.params.id } }).then((pub) => {
      return res.status(200).json({
        error: false,
        pub: pub
      });
    }).catch((err) => {
      return res.status(400).json({
        error: true,
        code: 107,
        message: "Error: Não foi possível mostrar os detalhes da Publicação!"
      });
    });
  }

  async index(req, res) {

    //const url = config.url + "/files/noticia/"; // Para puxar as imagens do BD

    Pub.findAll({}).then((pub) => {
      return res.status(200).json({
        error: false,
        pub
      });
    }).catch((err) => {
      return res.status(400).json({
        error: true,
        code: 101,
        message: "Erro: Não foi possível executar a solicitação!"
      });
    });
  }

  async indexBased(req, res) {

    //const url = config.url + "/files/noticia/"; // Para puxar as imagens do BD

    Pub.findAll({where: { userId: req.params.userId }}).then((pub) => {
      return res.status(200).json({
        error: false,
        pub
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
    const pub = await Pub.deleteOne({ id: req.params.id }, (err) => {
      if (err) return res.status(400).json({
        error: true,
        code: 122,
        message: "Error: Publicação não foi apagado com sucesso!"
      });
    });

    return res.status(200).json({
      error: false,
      message: "Publicação apagado com sucesso!"
    });
  }
}

export default new DAOPub();