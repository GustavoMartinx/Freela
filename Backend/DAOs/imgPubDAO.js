import multer from 'multer';
import fs from 'fs-extra';

class DAOImgPub {
  async armazenar(req, res) {
    var realFile = Buffer.from(req.body.imagem, "base64");
    fs.writeFileSync('uploads/' + req.body.nome, realFile, "utf-8");

    await res.send({ message: "Upload feito com sucesso!" });
  }

  async delete(req, res) {

    // de preferencia fazer com que um usuário tenha que estar logado para isso funcionar
    // usar o userAuth do config/auth.js
    const pub = await Pub.deleteOne({ id: req.params.id }, (err) => {
      if (err) return res.status(400).json({
        error: true,
        code: 122,
        message: "Error: Publicação não foi apagado com sucesso!"
      });
    });

    return res.status(200).json({
      error: false,
      message: "Publicação apagado com sucesso!"
    });
  }
}

export default new DAOImgPub();