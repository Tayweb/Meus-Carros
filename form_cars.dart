import 'package:flutter/material.dart';

class Form_cars extends StatelessWidget {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String modelo, anomodelo, marca, anofabricacao,placa;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Cadastro'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: _formUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Modelo'),
          maxLength: 20,
          validator: _validarModelo,
          onSaved: (String val) {
            modelo = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Ano do Modelo'),
            maxLength: 4,
            validator: _validarAnomodelo,
            onSaved: (String val) {
              anomodelo = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Marca'),
            maxLength: 15,
            validator: _validarMarca,
            onSaved: (String val) {
              marca= val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Ano de Fabricação'),
            maxLength: 4,
            validator: _validarAnofabricacao,
            onSaved: (String val) {
              anofabricacao = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Placa'),
            maxLength: 7,
            validator: _validarPlaca,
            onSaved: (String val) {
              placa = val;
            }),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: _sendForm,
          child: new Text('Salvar'),
        )
      ],
    );
  }
    //VALIDAÇÃO
  String _validarModelo(String value) {
    String patttern = r'([a-zA-Z\-0-9])';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o modelo";
    } else if (!regExp.hasMatch(value)) {
      return "Modelo inválido";
    }
    return null;
  }

  String _validarAnomodelo(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o ano do modelo";
    } else if(value.length != 4){
      return "O ano do modelo deve ter 4 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O ano do modelo só deve conter dígitos";
    }
    return null;
  }

  String _validarMarca(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe a marca do carro";
    } else if(!regExp.hasMatch(value)){
      return "A marca deve conter caracteres de a-z ou A-Z";
    }else {
      return null;
    }
  }

  String _validarAnofabricacao(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length != 4) {
      return "Informe o Ano de fabricação";
    } else if(!regExp.hasMatch(value)){
      return "O ano de fabricação só deve conter dígitos";
    }else {
      return null;
    }
  }

  String _validarPlaca(String value) {
    String pattern = r'([a-zA-Z\-0-9])';
    RegExp regExp = new RegExp(pattern);
    if (value.length != 7) {
      return "Placa inválida";
    } else if(!regExp.hasMatch(value)){
      return "Informe a Placa";

    }else {
      return null;
    }
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Modelo $modelo");
      print("Anomodelo $anomodelo");
      print("Marca $marca");
      print("Anofabricacao $anofabricacao");
      print("Placa $placa");
    } else {
      // erro de validação

    }
  }
}