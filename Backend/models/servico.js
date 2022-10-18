const Sequelize = require('sequelize');
const database = require('../db');
const Usuario = require('./usuario')

const Servico = database.define('SERVICO', {
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
},{ freezeTableName: true})


Usuario.hasMany(Servico,{
    foreignKey: 'geracpf'
})

Usuario.hasMany(Servico,{
    foreignKey: 'aceitacpf'
})


module.exports = Servico;