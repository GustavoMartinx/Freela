const { HasMany } = require('sequelize')
const Sequelize = require('sequelize')
const database = require('../db')
const Servico = require('../models/servico');

const Disponibilidade = database.define('DISPONIBILIDADE', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncremente: true
    },

    data: {
        type: Sequelize.DATE,
        allowNull: false,
    },

    semanal: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
    },

    horario_inicio: {
        type: Sequelize.STRING,
        allowNull: false,
    },

    horario_fim: {
        type: Sequelize.STRING,
        allowNull: false,
    }

}, { freezeTableName: true})

Servico.hasMany(Disponibilidade, {
    foreignKey: 'servicoID'
})

module.exports = Disponibilidade