import Pub from './pub.js';
import Usuario from './usuario.js';

Pub.belongsTo(Usuario);

Usuario.hasMany(Pub, {
    foreignKey: 'userId'
});

export { Pub, Usuario};