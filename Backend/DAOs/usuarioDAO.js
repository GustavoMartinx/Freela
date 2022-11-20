import Usuario from '../models/usuario.js';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
import jwtSecret from '../config/auth.js';
// const jwt = require('jsonwebtoken')
// const bcrypt = require('bcrypt')

class DAOUsuario {
    async registrar(req, res) {

        var dados = req.body;
        // criptografar a senha do usuário antes de guardar no banco de dados
        dados.senha = await bcrypt.hash(dados.senha, 10)
        //cria um usuário e insere no BD
        const user = await Usuario.create(dados, (err) => {
            if (err) return res.status(400).json({
                error: true,
                code: 101,
                message: "Error: Usuário não foi cadastrado com sucesso!"
            });
            // cria um json web token para manter logado
            // é necessário passar esse token sempre q fizer algo 

        });
        const maxAge = 3 * 60 * 60;
        const token = jwt.sign(
            { id: dados.id, nome: dados.nome },
            jwtSecret,
            {
                expiresIn: maxAge, // 3hrs in sec
            }
        );
        res.cookie("jwt", token, {
            httpOnly: false,
            maxAge: maxAge * 1000, // 3hrs in ms

        });
        res.status(201).json({
            error: false,
            message: "Usuário cadastrado com sucesso!",
            dados: user
        });
        return res;
    }

    async show(req, res) {

        Usuario.findOne({ where: { id: req.params.id } }).then((user) => {
            return res.status(200).json({
                error: false,
                user: user
            });
        }).catch((err) => {
            return res.status(400).json({
                error: true,
                code: 107,
                message: "Error: Não foi possível mostrar os detalhes do usuário!"
            });
        });
    }
    async login(req, res, next) {
        try {
            // procura o usuário que tentou logar no banco de dados
            var dados = req.body;
            const user = await Usuario.findOne({ where: { email: dados.email } })  // achando usuario
            //dados.senha = await bcrypt.hash(dados.senha, 10)
            bcrypt.compare(dados.senha, user.senha).then(function (result) {
                //cria um json web token pra ele
                // é necessário passar esse token sempre q fizer algo 
                console.log(result);

                if (result) {
                    const maxAge = 3 * 60 * 60;
                    const token = jwt.sign(
                        { id: user.id, nome: user.nome },
                        jwtSecret,
                        {
                            expiresIn: maxAge, // 3hrs in sec
                        }
                    );
                    res.cookie("jwt", token, {
                        httpOnly: true,
                        maxAge: maxAge * 1000, // 3hrs in ms
                    });
                    return res.status(201).json({
                        user: {
                            id: user._id,
                            name: user.name,
                            email: user.email
                        },
                        token: token
                    });
                } else {
                    res.cookie("jwt", 'not today', {
                        httpOnly: false,
                        maxAge: 2,
                    }); // escrevendo reto por linhas tortas AMEM
                    return res.status(400).json({ message: "Login not succesful" });
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
        const user = await Usuario.deleteOne({ id: req.params.id }, (err) => {
            if (err) return res.status(400).json({
                error: true,
                code: 122,
                message: "Error: Usuário não foi apagado com sucesso!"
            });
        });

        return res.status(200).json({
            error: false,
            message: "Usuário apagado com sucesso!"
        });
    }
    async userAuth(req, res, next) {
        const token = req.headers.cookie.slice(4);
        if (token) {
            jwt.verify(token, jwtSecret, (err, decodedToken) => {
                if (err) {
                    return res.status(401).json({ message: "Not authorized" })
                }
                // chamar essa funcao aqui dentro das outras qnd precisar verificar se o user ta logado msm
                // se tu chamar pela rota o comportamento certo é não responder nada e o postman ficar esperando pra sempre
            })
        } else {
            return res
                .status(401)
                .json({ message: "Not authorized, token not available" })
        }
    };
}

export default new DAOUsuario();