const express = require('express');
const app = express();

const rotaCliente = require('./routes/cliente');

app.use('/cliente', rotaCliente);

module.exports = app