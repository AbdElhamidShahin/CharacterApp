import 'package:flutter/material.dart';
import 'package:project_bloc/constance/my-colors.dart';

class CarctersItem extends StatelessWidget {
  const CarctersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: myColors.myWhite, child: Text("Caracters"));
  }
}
