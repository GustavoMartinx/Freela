import Usuario from '../models/usuario.js';

class DAOUsuario {
    async store(req, res) {

        var dados = req.body;

        const user = await Usuario.create(dados, (err) => {
            if (err) return res.status(400).json({        
                error: true,
                code: 101,
                message: "Error: Usuário não foi cadastrado com sucesso!"
            });
            // return res.status(200).json({
            //     error: false,
            //     message: "Usuário cadastrado com sucesso!",
            //     dados: user
            // });
        });

        return res.status(200).json({
            error: false,
            message: "Usuário cadastrado com sucesso!",
            dados: user
        });
    }

    async show(req, res) {

        Usuario.findOne({ where: {id: req.params.id} }).then((user) => {
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

    async delete(req, res) {

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
}

export default new DAOUsuario();