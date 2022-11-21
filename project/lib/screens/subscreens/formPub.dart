import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/screens/feed.dart';
import '../../models/pubForm.dart';
import 'package:http/http.dart' as http;

Future<Pub> createPub(
    String titulo,
    String vaga,
    String descricao,
    String datasHorarios,
    String valor,
    String modeloTrab,
    String cidadeBairro,
    String imagem) async {
  final response = await http.post(
    Uri.parse(
        'http://localhost:3000/store-pub/'), //https://jsonplaceholder.typicode.com/albums  // http://localhost:3000/store-pub/
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'titulo': titulo,
      'vaga': vaga,
      'descricao': descricao,
      'datasHorarios': datasHorarios,
      'valor': valor,
      'modeloTrab': modeloTrab,
      'cidadeBairro': cidadeBairro,
      'imagem': imagem,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Pub.fromJson(
        jsonDecode(response.body)['dados']); // estranho (colocar popup?)
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Pub.');
  }
}

void uploadImg(
  String base64Img,
  String nomeImg,
) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/upload-img-pub'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'imagem': base64Img,
      'nome': nomeImg,
    }),
  );

  if (response.statusCode == 201) {
    return;
  } else {
    throw Exception('Falha ao enviar a imagem.');
  }
}

class FormPub extends StatefulWidget {
  const FormPub({super.key});

  @override
  State<FormPub> createState() => _FormPubState();
}

class _FormPubState extends State<FormPub> {
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerVaga = TextEditingController();
  final TextEditingController _controllerDesc = TextEditingController();
  final TextEditingController _controllerDatasHorarios =
      TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();
  final TextEditingController _controllerModeloTrab = TextEditingController();
  final TextEditingController _controllerCidadeBairro = TextEditingController();
  Future<Pub>? _futurePub;

  XFile? imagemFile;
  late String titulo;
  late String vaga;
  late String descricao;
  late String datasHorarios;
  late String valor;
  late String modeloTrab;
  late String cidadeBairro;
  late String nomeImg;
  late String base64Img;

  Widget buildTitulo() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Título da Publicação',
          hintText: 'Informe um Título para a Publicação'),
      validator: (value) {
        if (value == '') {
          return 'Campo obrigatório';
        }
      },
      // onSaved: (value) {
      //   vaga = value.toString();
      // },
      controller: _controllerTitulo,
    );
  }

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
      controller: _controllerVaga,
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
        descricao = value.toString();
      },
      controller: _controllerDesc,
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
      controller: _controllerDatasHorarios,
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
      controller: _controllerValor,
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
      controller: _controllerModeloTrab,
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
      controller: _controllerCidadeBairro,
    );
  }

  Widget buildImage() {
    return ListTile(
      leading: Icon(Icons.image),
      title: const Text("Adicionar uma Imagem para a Publicação"),
      onTap: (() {
        selectImage();
      }),
      trailing: imagemFile != null
          ? Image.network(imagemFile!.path)
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
          child: buildForm(context),
        ),
      ),
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTitulo(),
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
              uploadImg(base64Img, nomeImg),
              setState(() {
                _futurePub = createPub(
                  _controllerTitulo.text,
                  _controllerVaga.text,
                  _controllerDesc.text,
                  _controllerDatasHorarios.text,
                  _controllerValor.text,
                  _controllerModeloTrab.text,
                  _controllerCidadeBairro.text,
                  nomeImg, // imagem
                );
              }),
              dialogBuilderNotify(context),
            },
          ),
        ],
      ),
    );
  }

  FutureBuilder<Pub> buildFutureBuilder() {
    return FutureBuilder<Pub>(
      future: _futurePub,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // dialogBuilderNotify(context);
          return Text(snapshot.data!.titulo); // publi (completa?) criada!
          //return Text(snapshot.data!.descricao);
          //return Text(snapshot.data!.datasHorarios);
          //return Text(snapshot.data!.valor);
          //return Text(snapshot.data!.modeloTrab);
          //return Text(snapshot.data!.cidadeBairro);
        } else if (snapshot.hasError) {
          return Text('eh isso aqui: ${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  void selectImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => imagemFile = file);

    final imageBytes = await file!.readAsBytes();
    MemoryImage(imageBytes);

    base64Img = base64Encode(imageBytes);
    nomeImg = file.path.split('/').last;

    return;
    // print(base64Image);

    // File imageFile = File(file!.path);
    // List<int> imageBytes = imageFile.readAsBytesSync();
    // String base64Image = base64.encode(imageBytes);
    // print(base64Image);

    // final xFile = await _controller.takePicture();
    // final path = file.path;
    // final bytes = await File(path).readAsBytes();
    // final img.Image image = img.decodeImage(bytes);

    //final imageFile = Image.network(file!.path);
    // XFile.fromData(Image.network("").);
    //String base64Image = base64Encode(imageBytes);
  }
}
