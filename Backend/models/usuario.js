import Sequelize from 'sequelize';
import database from '../config/db.js';

const Usuario = database.define('USUARIO', {
    cpf: {
        type: Sequelize.STRING,
        allowNull: false
    },
    email: {
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
        allowNull: true
    },

    fonteContato: {
        type: Sequelize.STRING,
        allowNull: true
    },
    
    contato: {
        type: Sequelize.STRING,
        allowNull: true
    },

    imagem: {
        type: Sequelize.STRING,
        allowNull: true,
    },

    descricao: {
        type: Sequelize.STRING,
        allowNull: true
    },
}, {
    freezeTableName: true,
    timestamps: false
});

export default Usuario;