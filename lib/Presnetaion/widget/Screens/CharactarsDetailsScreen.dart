import 'package:flutter/material.dart';
import 'package:project_bloc/constance/my-colors.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

class CharactarsDetailsScreen extends StatelessWidget {
  final Caracter caracter;
  CharactarsDetailsScreen({super.key, required this.caracter});
  Widget buildSelverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: myColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "${caracter.name}",
          style: TextStyle(color: myColors.myGray),
        ),
        background: Hero(
          tag: "${caracter.id}",
          child: Image.network("${caracter.image}", fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomScrollView(slivers: [buildSelverAppBar(),




    ]));
  }
}
