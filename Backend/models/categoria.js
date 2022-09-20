const Sequelize = require('sequelize');
const database = require('../db');
const Servico = require('./servico');

const Categoria = database.define('categoria',{
    id: {
        type: Sequelize.STRING,
        allowNull: false,
        primaryKey: true,
    },

    nome: {
        type: Sequelize.STRING,
        allowNull: false
    }
})

Categoria.belongsToMany(Servico, {
    foreignKey: 'id'
})

Servico.belongsToMany(Categoria, {
    foreignKey: 'id'
})

module.export = Categoria;