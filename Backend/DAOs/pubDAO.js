import Pub from '../models/pub.js';
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

        Pub.findOne({ where: {id: req.params.id} }).then((pub) => {
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
    async login(req, res, next){
            try {
            // procura o usuário que tentou logar no banco de dados
            const user = await Pub.findOne({ where: {id: req.params.id} })
            bcrypt.compare(req.senha, user.senha).then(function (result) {
            //cria um json web token pra ele
            // é necessário passar esse token sempre q fizer algo 
              if (result) {
                const maxAge = 3 * 60 * 60;
                const token = jwt.sign(
                  {id: user.cpf, nome},
                  jwtSecret,
                  {
                    expiresIn: maxAge, // 3hrs in sec
                  }
                );
                res.cookie("jwt", token, {
                  httpOnly: true,
                  maxAge: maxAge * 1000, // 3hrs in ms
                });
                res.status(201).json({
                  message: "User successfully Logged in"
                });
              } else {
                res.status(400).json({ message: "Login not succesful" });
              }
            });
          } catch (error) {
          res.status(400).json({
            message: "An error occurred",
            error: error.message,
          });
        }
        };

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