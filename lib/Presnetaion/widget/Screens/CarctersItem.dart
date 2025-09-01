import 'package:flutter/material.dart';
import 'package:project_bloc/constance/my-colors.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

class CarctersItem extends StatelessWidget {
  CarctersItem({super.key, required this.allCaracters});
  final Caracter allCaracters;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColors.myWhite,
      child: Column(
        children: [
          Image.network(allCaracters.image ?? ''),
          Text(allCaracters.name ?? ''),
        ],
      ),
    );
  }
}
