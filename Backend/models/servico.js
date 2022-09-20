const Sequelize = require('sequelize');
const database = require('../db');
const Usuario = require('./usuario')

const Servico = database.define('servico', {
    id: {
        type: Sequelize.INTEGER,
        autoIncremente: true,
        allowNull: false,
        primaryKey: true
    },

    valor: {
        type: Sequelize.FLOAT,
        allowNull: false
    },

    descricao: {
        type: Sequelize.STRING,
        allowNull: false
    }
})


Usuario.hasMany(Servico,{
    foreignKey: 'cpf'
})


module.exports = Servico;