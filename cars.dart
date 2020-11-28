class Carros {
  String _id;
  String _modelo;
  String _anomodelo;
  String _marca;
  String _anofabricacao;
  String _placa;


  Carros(this._modelo, this._anomodelo, this._marca, this._anofabricacao, this._placa);

  Carros.map(dynamic obj) {
    this._id = obj['id'];
    this._modelo = obj['modelo'];
    this._anomodelo = obj['anomodelo'];
    this._marca = obj['marca'];
    this._anofabricacao = obj['anofabricacao'];
    this._placa = obj['placa'];
  }

  String get id => _id;
  String get modelo => _modelo;
  String get anomodelo => _anomodelo;
  String get marca => _marca;
  String get anofabricacao => _anofabricacao;
  String get placa => _placa;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['modelo'] = _modelo;
    map['anomodelo'] = _anomodelo;
    map['marca'] = _marca;
    map['anofabricacao'] = _anofabricacao;
    map['placa'] = _placa;

    return map;
  }

  Carros.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._modelo = map['modelo'];
    this._anomodelo = map['anomodelo'];
    this._marca = map['marca'];
    this._anofabricacao = map['anofabricacao'];
    this._placa = map['placa'];

  }
}
