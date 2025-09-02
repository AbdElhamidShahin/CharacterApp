import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/cubit.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/state.dart';
import 'package:project_bloc/constance/my-colors.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

import 'Presnetaion/widget/Screens/CarctersItem.dart';

class CharactarsScreen extends StatefulWidget {
  CharactarsScreen({super.key});
  @override
  State<CharactarsScreen> createState() => _CharactarsScreenState();
}

late List<Caracter> allCaracters;

class _CharactarsScreenState extends State<CharactarsScreen> {
  @override
  void initState() {
    super.initState();
    allCaracters = BlocProvider.of<CaractersCubit>(context).getAllCharactars();
  }

  Widget BuildLodedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: myColors.myGray,
        child: Column(children: [BuildCaractersList()]),
      ),
    );
  }

  Widget BuildCaractersList() {
    return GridView.builder(
      shrinkWrap: true, // مهم
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemCount: allCaracters.length,
      itemBuilder: (context, index) {
        return CarctersItem(allCaracters: allCaracters[index]);
      },
    );
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CaractersCubit, CaractersState>(
      builder: (context, state) {
        if (state is CaractersLaodedState) {
          allCaracters = (state).caracters;
          return BuildLodedListWidget();
        } else {
          return Center(
            child: CircularProgressIndicator(color: myColors.myYello),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors.myYello,
        title: Center(
          child: Text(
            "Charactar",
            style: TextStyle(color: myColors.myWhite, fontSize: 32),
          ),
        ),
      ),
      body: BuildBlocWidget(),
    );
  }
}
