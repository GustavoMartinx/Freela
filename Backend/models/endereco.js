const Sequelize = require('sequelize')
const database = require('../db')
const Usuario = require('./usuario')


const Endereco = database.define('ENDERECO', {
    rua: {
        type: Sequelize.STRING,
        allowNull: false
    },

    numero: {
        type: Sequelize.STRING,
        allowNull: false
    },

    bairro: {
        type: Sequelize.STRING,
        allowNull: false
    },
}, { freezeTableName: true})

Usuario.hasMany(Endereco,{
    foreignKey: 'usuarioDono'
})


module.exports = Endereco