import Sequelize from 'sequelize';
import database from '../config/db.js';
import Usuario from './usuario.js';

const Pub = database.define('PUB', {

    nomeUsuario: {
        type: Sequelize.STRING,
        allowNull: false
    },
    
    titulo: {
        type: Sequelize.STRING,
        allowNull: false
    },

    vaga: {
        type: Sequelize.STRING,
        allowNull: false
    },

    descricao: {
        type: Sequelize.STRING,
        allowNull: true,
    },

    datasHorarios: {
        type: Sequelize.STRING,
        allowNull: true
    },

    valor: {
        type: Sequelize.STRING,
        allowNull: true
    },

    modeloTrab: {
        type: Sequelize.STRING,
        allowNull: true
    },

    cidadeBairro: {
        type: Sequelize.STRING,
        allowNull: true
    },
    
    imagem: {
        type: Sequelize.TEXT,
        allowNull: true
    },

}, {
    freezeTableName: true,
    timestamps: false
});

export default Pub;