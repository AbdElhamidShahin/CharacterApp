
import 'package:flutter/material.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

import '../../../constance/my-colors.dart';

Widget buildSliverAppBar(Caracter caracter) {
  return SliverAppBar(
    expandedHeight: 600,
    pinned: true,
    stretch: true,
    backgroundColor: myColors.myGray,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        caracter.name ?? "",
        style: TextStyle(
          color: myColors.myWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
      background: Hero(
        tag: "${caracter.id}",
        child: Image.network(caracter.image ?? "", fit: BoxFit.cover),
      ),
    ),
  );
}
