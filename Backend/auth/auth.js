const Sequelize = require('sequelize');
var User = require("../index");
const express = require("express")
const router = express.Router()
const jwt = require('jsonwebtoken')

const jwtSecret =
  "4715aed3c946f7b0a38e6b534a9583628d84e96d10fbc04700770d572af3dce43625dd" // não usar em produção

  exports.register = async (req, res, next) => {
    const { cpf, senha, nome, descricao, avaliacao} = req.body;
    bcrypt.hash(senha, 10).then(async (hash) => {
      await User.cadastrarUsuario({
      cpf,
      senha, 
      nome,
      descricao, 
      avaliacao
      })
        .then((user) => {
          const maxAge = 3 * 60 * 60;
          const token = jwt.sign(
            { id: user.cpf, nome},
            jwtSecret,
            {
              expiresIn: maxAge, // 3hrs in sec
            }
          );
          res.cookie("jwt", token, {
            httpOnly: true,
            maxAge: maxAge * 1000, // 3hrs in ms
          });
          res.status(201).json({
            message: "User successfully created",
          });
        })
        .catch((error) =>
          res.status(400).json({
            message: "User not successful created",
            error: error.message,
          })
        );
    });
  };
router.post("/register", this.register)

exports.login = async (req, res, next) => {
    try {
    const user = await User({ cpf, senha })
    bcrypt.compare(senha, user.senha).then(function (result) {
      if (result) {
        const maxAge = 3 * 60 * 60;
        const token = jwt.sign(
          {id: user.cpf, nome},
          jwtSecret,
          {
            expiresIn: maxAge, // 3hrs in sec
          }
        );
        res.cookie("jwt", token, {
          httpOnly: true,
          maxAge: maxAge * 1000, // 3hrs in ms
        });
        res.status(201).json({
          message: "User successfully Logged in"
        });
      } else {
        res.status(400).json({ message: "Login not succesful" });
      }
    });
  } catch (error) {
  res.status(400).json({
    message: "An error occurred",
    error: error.message,
  });
}
};
router.post("/login", this.login)

exports.deleteUser = async (req, res, next) => {
  const { id } = req.body
  await User.findById(id)
    .then(user => user.remove())
    .then(user =>
      res.status(201).json({ message: "User successfully deleted", user })
    )
    .catch(error =>
      res
        .status(400)
        .json({ message: "An error occurred", error: error.message })
    )
}

// router.route("/deleteUser").delete(deleteUser);

exports.userAuth = (req, res, next) => {
  const token = req.cookies.jwt
  if (token) {
    jwt.verify(token, jwtSecret, (err, decodedToken) => {
      if (err) {
        return res.status(401).json({ message: "Not authorized" })
      } else {
        if (decodedToken.role !== "Basic") {
          return res.status(401).json({ message: "Not authorized" })
        } else {
          next()
        }
      }
    })
  } else {
    return res
      .status(401)
      .json({ message: "Not authorized, token not available" })
  }
}

module.exports = router