const Sequelize = require('sequelize');
const database = require('../db');
const Servico = require('../models/servico');

const Categoria = database.define('CATEGORIA', {
    id: {
        type: Sequelize.INTEGER,
        autoIncremente: true,
        allowNull: false,
        primaryKey: true
    },

    nome: {
        type: Sequelize.STRING,
        allowNull: false
    }

},{ freezeTableName: true})

Servico.belongsToMany(Categoria, { through: 'servicoTemCategoria' });
Categoria.belongsToMany(Servico, { through: 'servicoTemCategoria' });

module.exports = Categoria;