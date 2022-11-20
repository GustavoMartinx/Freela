import { Router } from 'express';

const routes = new Router();

import DAOUsuario from '../DAOs/usuarioDAO.js';
import DAOPub from '../DAOs/pubDAO.js';
// import DAOApp from '../DAOs/appDAO.js';
// import DAOCategoria from '../DAOs/categoriaDAO.js';
// import DAODisponibilidade from '../DAOs/disponibilidadeDAO.js';
// import DAOServico from '../DAOs/servicoDAO.js';


routes.post('/register-usuario', DAOUsuario.registrar);
routes.post('/login-usuario', DAOUsuario.login);
routes.get('/delete-usuario/:id', DAOUsuario.delete);
routes.get('/show-usuario/:id', DAOUsuario.show);
routes.get('/teste-de-cookies', DAOUsuario.userAuth);

routes.post('/store-pub', DAOPub.cadastrar);
routes.get('/index-pub', DAOPub.index);
// routes.get('/delete-pub/:id', DAOUsuario.delete);


// routes.post('/cad-categoria', CategoriaController.cadastrarCategoria);
// routes.get('/show-categoria', CategoriaController.pesquisarCategorias);

// routes.post('/cad-disponibilidade', DisponibilidadeController.adicionarDisponibilidade);
// routes.get('/show-disponibilidade', DisponibilidadeController.procurarDisponibilidade);

// routes.post('/cad-gerar-servico', ServicoController.gerarServico);
// routes.post('/cad-aceitar-servico', ServicoController.aceitaServico);
// routes.get('/show-servicos-aceitos', ServicoController.servicosAceitos);
// routes.post('/show-servicos-gerados', ServicoController.servicosGerados);

export default routes;