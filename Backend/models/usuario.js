const Sequelize = require('sequelize');
const database = require('../db');

const Usuario = database.define('usuario', {
    cpf: {
        type: Sequelize.STRING,
        autoIncrement: false,
        allowNull: false,
        primaryKey: true,
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
})

module.exports = Usuario;