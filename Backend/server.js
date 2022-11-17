// Inicialização do servidor

import app from './index.js';

const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log('Freela rodando na porta: ', port);
});

// Rotas em index.js

// const rotaCliente = require('./routes/cliente');

// app.use('/cliente', rotaCliente);

// module.exports = app