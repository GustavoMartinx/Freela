import Sequelize from 'sequelize';
import database from '../config/db.js';

const Usuario = database.define('USUARIO', {
    cpf: {
        type: Sequelize.STRING,
        allowNull: false
    },

    senha: {
        type: Sequelize.STRING,
        allowNull: false
    },
    
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    },

    profissao: {
        type: Sequelize.STRING,
        allowNull: false
    },

    imagem: {
        type: Sequelize.STRING,
        allowNull: true,
    },

    descricao: {
        type: Sequelize.STRING,
        allowNull: true
    },

    // avaliacao: {
    //     type: Sequelize.INTEGER,
    //     allowNull: false,
    // },

    // Criar uma tabela Login?

    // senha: {
    //     type: Sequelize.STRING,
    //     allowNull: false
    // }
}, {
    freezeTableName: true,
    timestamps: false
});

export default Usuario;