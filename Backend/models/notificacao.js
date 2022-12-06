import Sequelize from 'sequelize';
import database from '../config/db.js';

const Notificacao = database.define('NOTIFICACAO', {
    titulo: {
        type: Sequelize.STRING,
        allowNull: false
    },

    fonteContato: {
        type: Sequelize.STRING,
        allowNull: false
    },
    
    contato: {
        type: Sequelize.STRING,
        allowNull: false
    },

}, {
    freezeTableName: true,
    timestamps: false
});

export default Notificacao;