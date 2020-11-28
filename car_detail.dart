import 'package:colecao_de_carros/utils/utils.dart';
import 'package:flutter/material.dart';
import '../widgets/specific_card.dart';

class CarDetail extends StatelessWidget {
  final String anomodelo;
  final String placa;
  final String anofabricacao;
  final String modelo;
  final String marca;
  final String path;

  CarDetail(
      {this.modelo,
        // ignore: non_constant_identifier_names
        this.anomodelo,
        this.anofabricacao,
        this.placa,
        this.marca,
        this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.delete,
                  size: 30, color: Colors.red)),
        ],
      ),
      body: Column(
        children: [
          Text(modelo, style: MainHeading),
          Text(
            marca,
            style: BasicHeading,
          ),
          Hero(tag: modelo, child: Image.asset(path)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpecificsCard(
                name: 'Placa',
                name2: placa,
              ),
              SpecificsCard(
                name: 'Fabricação',
                name2: anofabricacao,
              ),
              SpecificsCard(
                name: 'Ano Modelo',
                name2: '2018',
              )
            ],
          ),
          SizedBox(height: 20),

        ],
      ),

    );
  }
}
