const Sequelize = require('sequelize');
const database = require('../db');

const Usuario = database.define('USUARIO', {
    cpf: {
        type: Sequelize.STRING,
        autoIncrement: false,
        allowNull: false,
        primaryKey: true,
    },

    senha: {
        type: Sequelize.STRING, // mudar o tamanho disso daqui
        autoIncrement: false,
        allowNull: false, 
        primaryKey: false,
    },

    nome: {
        type: Sequelize.STRING,
        allowNull: false
    },

    descricao: {
        type: Sequelize.STRING,
        allowNull: false
    },

    avaliacao: {
        type: Sequelize.INTEGER,
        allowNull: false,
    }
}, { freezeTableName: true})

module.exports = Usuario;