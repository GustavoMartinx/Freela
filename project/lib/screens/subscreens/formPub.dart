import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormPub extends StatefulWidget {
  const FormPub({super.key});

  @override
  State<FormPub> createState() => _FormPubState();
}

class _FormPubState extends State<FormPub> {
  XFile? image;
  late String vaga;
  late String desc;
  late String datasHorarios;
  late String valor;
  late String modeloTrab;
  late String cidadeBairro;

  Widget buildVaga() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Vaga', hintText: 'Informe a vaga ofertada'),
      validator: (value) {
        if (value == '') {
          return 'Campo obrigatório';
        }
      },
      onSaved: (value) {
        vaga = value.toString();
      },
    );
  }

  Widget buildDesc() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Descrição',
          hintText: 'Escreva uma descrição resumida da vaga'),
      validator: (value) {
        if (value == '') {
          return 'Campo obrigatório';
        }
      },
      onSaved: (value) {
        desc = value.toString();
      },
    );
  }

  Widget buildDatasHorarios() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Datas/Horários',
          hintText: 'Informe sobre a rotina de trabalho da vaga'),
      validator: (value) {
        if (value == '') {
          return 'Campo obrigatório';
        }
      },
      onSaved: (value) {
        datasHorarios = value.toString();
      },
    );
  }

  Widget buildValor() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Valor', hintText: 'Informe sobre o valor da vaga'),
      validator: (value) {
        if (value == '') {
          return 'Campo obrigatório';
        }
      },
      onSaved: (value) {
        valor = value.toString();
      },
    );
  }

  Widget buildModeloTrab() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Modelo de Trabalho', hintText: 'Presencial/Home office'),
      validator: (value) {
        if (value == '') {
          return 'Campo obrigatório';
        }
      },
      onSaved: (value) {
        modeloTrab = value.toString();
      },
    );
  }

  Widget buildCidadeBairo() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Cidade e Bairro'),
      validator: (value) {
        if (value == '') {
          return 'Campo obrigatório';
        }
      },
      onSaved: (value) {
        cidadeBairro = value.toString();
      },
    );
  }

  Widget buildImage() {
    return ListTile(
      leading: Icon(Icons.image),
      title: Text("Adicionar uma Imagem para a Publicação"),
      onTap: selectImage,
      trailing: image != null
          ? Image.network(image!.path)
          : null, // Image.file(File(image!.path))
    );
  }

  Future<void> dialogBuilderNotify(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            titlePadding: const EdgeInsets.all(0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                      height: 50,
                      width: 500,
                      child: Text('Publicação feita com sucesso!',
                          textAlign: TextAlign.center)),
                )
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 800,
          // padding: EdgeInsets.only(top: 10, left: 700),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildVaga(),
                buildDesc(),
                buildDatasHorarios(),
                buildValor(),
                buildModeloTrab(),
                buildCidadeBairo(),
                buildImage(),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text(
                    'Publicar',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  onPressed: () => {
                    dialogBuilderNotify(context),
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  selectImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => image = file);
  }
}
