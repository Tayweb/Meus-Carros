import 'package:colecao_de_carros/utils/utils.dart';
import 'package:flutter/material.dart';

class SpecificsCard extends StatelessWidget {
   final String name;
  final String name2;

  SpecificsCard({ this.name, this.name2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: name == null
          ? Column(
        children: [
          Text(
            name,
            style: BasicHeading,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name2,
            style: SubHeading,
          ),
        ],
      )
          : Column(
        children: [
          Text(
            name,
            style: BasicHeading,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 5,
          ),
          Text(name2)
        ],
      ),
    );
  }
}
