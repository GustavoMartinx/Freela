import Sequelize from 'sequelize';
import dotenv from 'dotenv';
dotenv.config();

const sequelize = new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD, {
  dialect: 'mysql',
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT)
});

try {
  sequelize.authenticate();
  console.log('Conexão estabelecida com sucesso!');
} catch (error) {
  console.error('Erro: Falha na conexão - ', error);
}

export default sequelize;