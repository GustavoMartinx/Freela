import { Router } from 'express';

const routes = new Router();

import DAOUsuario from '../DAOs/usuarioDAO.js';
// import DAOApp from '../DAOs/appDAO.js';
// import DAOCategoria from '../DAOs/categoriaDAO.js';
// import DAODisponibilidade from '../DAOs/disponibilidadeDAO.js';
// import DAOServico from '../DAOs/servicoDAO.js';


routes.post('/store-usuario', DAOUsuario.cadastrar);
routes.post("/login", DAOUsuario.login);
routes.get('/delete-usuario/:id', DAOUsuario.delete);

routes.get('/show-usuario/:id', DAOUsuario.show);


// routes.post('/cad-categoria', CategoriaController.cadastrarCategoria);
// routes.get('/show-categoria', CategoriaController.pesquisarCategorias);

// routes.post('/cad-disponibilidade', DisponibilidadeController.adicionarDisponibilidade);
// routes.get('/show-disponibilidade', DisponibilidadeController.procurarDisponibilidade);

// routes.post('/cad-gerar-servico', ServicoController.gerarServico);
// routes.post('/cad-aceitar-servico', ServicoController.aceitaServico);
// routes.get('/show-servicos-aceitos', ServicoController.servicosAceitos);
// routes.post('/show-servicos-gerados', ServicoController.servicosGerados);

export default routes;